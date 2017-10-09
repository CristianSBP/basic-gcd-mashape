//
//  MashapeApi.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 7/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class MashapeApi {
    
    public let baseURL = "https://omgvamp--hearthstone--v1-p-mashape-com-ormvxmez8gb9.runscope.net"
    
    public lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let headers = ["X-Mashape-Key": "BRGxteEFzFmshQItCIFu8g5ntVrKp15JpkFjsnr8kbh1losdFD", "Accept": "application/json"]
        configuration.httpAdditionalHeaders = headers
        configuration.timeoutIntervalForRequest = TimeInterval(30.0)
        return URLSession(configuration: configuration)
    }()
}

extension URLSession {
    
    public func JSONTask(with url: URL, _ completion: @escaping (Result<Any>) -> Void) {
        
        dataTask(with: url) { (data, urlResponse, error) in
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
    
    public func JSONTask(with url: URL, queue: DispatchQueue, _ completion: @escaping (Result<Any>) -> Void) {
        queue.async {
            self.dataTask(with: url) { (data, urlResponse, error) in
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
