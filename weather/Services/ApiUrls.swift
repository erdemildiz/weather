//
//  ApiUrls.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation


struct ApiUrl {       
    
    static let cities = "https://weathercase-99549.firebaseio.com/.json"
    static func citiesWeather(using ids: [Int]) -> String {
        let cityIds = ids.map { "\($0)" }.joined(separator: ",")
        return ApiConfig.getBaseURL() + "group?id=" + cityIds + ApiConfig.getApiPrivateToken()
    }
}

