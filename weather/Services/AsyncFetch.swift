//
//  AsyncFetch.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

typealias error = (Error) -> Void

struct AsyncFetch {
    
    static func fetch<T: Codable>(url: URL, model: T.Type, success: @escaping (T) -> Void, failure: @escaping error) {
        let urlSessionDataTask = URLSession.shared.dataTask(with: url) { (data, responce, error) in
            
            // Decode data
            if let data = data {
                
                do {
                    let responceData = try JSONDecoder().decode(model, from: data)
                    success(responceData)
                } catch  {
                    print("Error: \(error.localizedDescription)")
                    failure(error)
                }
                
            }
        }
        
        urlSessionDataTask.resume()
    }
}
