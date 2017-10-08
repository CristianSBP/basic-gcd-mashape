//
//  MashapeApi.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 7/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class MashapeApi {
    
    private let baseURL = "https://omgvamp--hearthstone--v1-p-mashape-com-ormvxmez8gb9.runscope.net"
    
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let headers = ["X-Mashape-Key": "BRGxteEFzFmshQItCIFu8g5ntVrKp15JpkFjsnr8kbh1losdFD", "Accept": "application/json"]
        configuration.httpAdditionalHeaders = headers
        configuration.timeoutIntervalForRequest = TimeInterval(10.0)
        return URLSession(configuration: configuration)
    }()
    
    public func getInfo(_ completion: @escaping () -> Void) {
        
        let url = URL(string: "\(baseURL)/info")!
        
        session.JSONTask(with: url) { (result) in
            switch result {
            case .success(let json):
                guard var dic = json as? [String: Any] else { return }
                dic["patch"] = [dic["patch"]]
                Session.shared.info = dic as! [String: [String]]
            case .failed(let message):
                print(message)
            }
            completion()
        }
    }
    
    public func cardsBy(_ completion: @escaping () -> Void) {
        let name = Session.shared.classes[1]
        let url = URL(string: "\(baseURL)\(CardsBy._class(name).url)")!
        
        session.JSONTask(with: url) { (result) in
            switch result {
            case .success(let json):
                let dictionary = json as! [[String: Any]]
                Session.shared.cardsCount = dictionary.count
            case .failed(let message):
                print(message)
            }
            completion()
        }
    }
}

extension URLSession {
    
    public func JSONTask(with url: URL, _ completion: @escaping (Result<Any>) -> Void) {
        
        dataTask(with: url) { (data, urlResponse, error) in
            print(Thread.isMainThread)
            
            if let error = error {
                return completion(.failed(error.localizedDescription))
            }
            
            guard let data = data else {
                return completion(.failed("Data is null"))
            }
            
            do {
                if let resultJSONObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    return completion(.success(resultJSONObject))
                } else if let resultJSONArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    return completion(.success(resultJSONArray))
                } else {
                    return completion(.failed("Invalid JSON format"))
                }
            } catch {
                return completion(.failed("Can't parse Data to JSON"))
            }
            
        }.resume()
    }
}

enum CardsBy {
    
    case _class(String)
    
    var url: String {
        switch self {
        case ._class(let name):
            return "/cards/classes/\(name)"
        }
    }
}
