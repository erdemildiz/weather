//
//  CitySelectionViewModel.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

class CitySelectionViewModel {
    
    var cities = [CitySelectionModel]()
    var filteredCities = [CitySelectionModel]()
    var citiesDidLoad: ((_ failure: Bool) -> Void)?
    var citiesfiltered: (() -> Void)?
    var didResetFilter: (() -> Void)?
    
    func fetchCities(){
        Api.get(using: ApiUrl.cities, model: [CityModel].self, success: { [weak self] (cities) in
            self?.cities = self?.calculateCities(cities) as! [CitySelectionModel]
            self?.filteredCities = self?.cities as! [CitySelectionModel]
            self?.citiesDidLoad?(false)
        }) { (error) in
            self.citiesDidLoad?(true)
            print(error)
        }
    }
    
    fileprivate func calculateCities(_ cityList: [CityModel]) -> [CitySelectionModel] {
        var citySelection = [CitySelectionModel]()
        let uniqueCitiesLetters = cityList
            .compactMap { city  in city.name.first }
            .unique()
        
        
        uniqueCitiesLetters
            .forEach { letter in
                let filteredCity = cityList
                    .filter { (city) -> Bool in
                        city.name.hasPrefix("\(letter)")
                }
                citySelection.append(
                    CitySelectionModel(letter: letter, cities: filteredCity)
                )
        }
        // For bottom issue for tableview
        citySelection.append(
            CitySelectionModel(letter: " ", cities: [CityModel(id: -1, name: "")])
        )
        
        return citySelection
    }
    
    func filterCity(by cityName: String) {
        self.cities = filteredCities
            .filter { cityModel in
                var hasIn = false
                cityModel.cities.forEach { city in
                    if city.name.hasPrefix(cityName) {
                        hasIn = true
                    }
                }
                return hasIn
        }
        citiesfiltered?()
        
    }
    
    func resetFilter() {
        self.cities = self.filteredCities
        didResetFilter?()
    }
    
}
