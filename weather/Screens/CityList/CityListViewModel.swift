//
//  CityListViewModel.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

class CityListViewModel {
    
    @Storage("registered_city_ids", defaultValue: [Int]())
    var registeredCities: [Int]?
    
    var citiesWeatherDidLoad: ((_ failure: Bool) -> Void)?
    var citiesWeathers: CitiesWeatherModel?
    
    func fetchCitiesWeatherInfos(){
        guard let registeredCities = registeredCities, registeredCities.count > 0 else { return }
        Api.get(using: ApiUrl.citiesWeather(using: registeredCities), model: CitiesWeatherModel.self, success: { [weak self] (citiesWeathers) in
            self?.citiesWeathers = citiesWeathers
            self?.citiesWeatherDidLoad?(false)
        }) { (error) in
            self.citiesWeatherDidLoad?(true)
        }
    }
}
