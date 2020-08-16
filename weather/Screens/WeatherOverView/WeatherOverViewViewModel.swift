//
//  WeatherOverViewViewModel.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

class WeatherOverViewViewModel {
    
    var citiesDidLoad: ((_ failure: Bool) -> Void)?
    var cities = [CityModel]()
    var activeCity: CityModel?
    
    init() {
        // Fetch cities
        fetchCities()
    }
    
    func fetchCities() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.cities = [
                  CityModel(id: 1, name: "Ankara"),
                  CityModel(id: 2, name: "İstanbul"),
                  CityModel(id: 3, name: "Çanakkale")
            ]
            self.setActiveCity(city: self.cities[0])
        }
  
        
//        Api.get(using: ApiUrl.cities, model: [CityModel].self, success: {[weak self] (cities) in
//            self?.cities = citiesData
//            self?.citiesDidLoad?(false)
//        }) { (error) in
//            self.citiesDidLoad?(true)
//            fatalError(error)
//        }
    }
    
    func setActiveCity(city: CityModel){
        activeCity = city
        citiesDidLoad?(false)
    }
}
