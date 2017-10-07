//
//  MashapeApi.swift
//  mashape-heartstone
//
//  Created by Cristian Palomino Rivera on 7/10/17.
//  Copyright © 2017 Cristian Palomino Rivera. All rights reserved.
//

import Foundation

class MashapeApi {
    
    private let baseURL = "https://omgvamp-hearthstone-v1.p.mashape.com"
    
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let headers = ["X-Mashape-Key": "BRGxteEFzFmshQItCIFu8g5ntVrKp15JpkFjsnr8kbh1losdFD", "Accept": "application/json"]
        configuration.httpAdditionalHeaders = headers
        configuration.timeoutIntervalForRequest = TimeInterval(10.0)
        return URLSession(configuration: configuration)
    }()
    
    public func getInfo(_ completion: @escaping (Result<Any>) -> Void) {
        
        let url = URL(string: "\(baseURL)/info")!
        
        session.dataTask(with: url) { (data, urlResponse, error) in
            
            if let error = error {
                return completion(.failed(error.localizedDescription))
            }
            
            guard let data = data else {
                return completion(.failed("Data is null"))
            }
            
            do {
                guard let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    return completion(.failed("Invalid JSON format"))
                }
                
                return completion(.success(result))
            } catch {
                return completion(.failed("Can't parse Data to JSON"))
            }
            
            }.resume()
    }
    
    public func  
}
