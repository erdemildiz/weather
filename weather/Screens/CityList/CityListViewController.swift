//
//  CityListViewController.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import SnapKit

class CityListViewController: CustomViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup
        setupUI()
    
//        showLoading()
//        Api.get(using: ApiUrl.cities, model: [City].self, success: { [weak self] (cities) in
//            for city in cities {
//                print(city.name)
//            }
//            self?.hideLoading()
//        }) { (error) in
//            print(error)
//        }
    }
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        title = Constants.cityListPageTitle
    }
    
}
