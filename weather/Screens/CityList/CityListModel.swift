//
//  CityListModel.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

struct City: Codable {
    let id: Int
    let name: String
}

struct CitiesWeatherListModel: Codable {
    let coord: CoordinateModel
    let weather: [WeatherModel]
    let main: MainWeatherInfoModel
    let visibility: Int
    let wind: WindModel
    let clouds: CloudModel
    let name: String
}

struct CitiesWeatherModel: Codable {
    let cnt: Int
    let list: [CitiesWeatherListModel]
}

struct CoordinateModel: Codable {
    let lon: Float
    let lat: Float
}

struct WeatherModel: Codable {
    let main: String
    let description: String
}

struct MainWeatherInfoModel: Codable {
    let temp: Float
    let temp_min: Float
    let temp_max: Float
    let humidity: Int
}

struct WindModel: Codable {
    let speed: Float
    let deg: Int
}

struct CloudModel: Codable {
    let all: Int
}
