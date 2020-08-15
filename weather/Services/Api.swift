//
//  Api.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

struct Api {

    static func get<T: Codable>(using url: String, model: T.Type, success: @escaping (T) -> Void, failure: @escaping error) {
        guard let url = URL(string: url) else {  return }
        AsyncFetch.fetch(url: url, model: model, success: success, failure: failure)
    }
    
}
