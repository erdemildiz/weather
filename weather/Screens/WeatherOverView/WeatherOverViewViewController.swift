//
//  WeatherOverViewViewController.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//
struct Responce: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

class WeatherOverViewViewController: CustomViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup
        setupUI()
    }
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        title = Constants.weatherPageTitle
    }
}
