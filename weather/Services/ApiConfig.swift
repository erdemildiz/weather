//
//  ApiConfig.swift
//  weather
//
//  Created by Erdem ILDIZ on 17.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

struct ApiConfig {
    
    static private let API_BASE_URL = "http://api.openweathermap.org/data/2.5/"
    static private let API_PRIVATE_TOKEN = "ab60ec6a3c462a257566adf804cb8613"
    
    static func getBaseURL() -> String {
        return API_BASE_URL
    }
    
    static func getApiPrivateToken() -> String {
        return "&appid=" + API_PRIVATE_TOKEN + getProps()
    }
    
    static private func getProps() -> String {
        return "&units=metric"
    }
    
}
