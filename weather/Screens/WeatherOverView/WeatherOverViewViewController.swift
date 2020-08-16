//
//  WeatherOverViewViewController.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//
import UIKit
import SnapKit

class WeatherOverViewViewController: CustomViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    lazy var cityListView: CityListView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cityListView = CityListView(frame: .infinite, collectionViewLayout: layout)
        cityListView.cityListDelegate = self
        return cityListView
    }()
    let viewModel = WeatherOverViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup
        setupUI()
        // Setup ScrollView
        setupScrollView()
        // Setup City List
        setupCityList()
        // Fetch
        fetchCities()
        // Setup Model Observers
        observeCitiesLoad()
    }
    
    // MARK: SETUP
    fileprivate func setupUI() {
        view.backgroundColor = .white
        title = Constants.weatherPageTitle
    }
    
    fileprivate func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
        }
    }
    
    fileprivate func setupCityList(){
        scrollView.addSubview(cityListView)
        cityListView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(25)
            make.top.equalTo(25.5)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: Network
    fileprivate func observeCitiesLoad() {
        viewModel.citiesDidLoad = { failure in
            if !failure {
                DispatchQueue.main.async { [weak self] in
                    if self?.viewModel.cities.count ?? 0 > 0 {
                        self?.cityListView.activeCity = self?.viewModel.activeCity
                        self?.cityListView.cities = self?.viewModel.cities as! [CityModel]
                        self?.hideLoading()
                        self?.cityListView.reloadData()
                    }
                }
            }
            
        }
    }
    
    fileprivate func fetchCities(){
        showLoading()
        viewModel.fetchCities()
    }
}

// MARK: CityListViewDelegate
extension WeatherOverViewViewController: CityListViewDelegate {
    func didSelectCity(city: CityModel) {
        viewModel.setActiveCity(city: city)
    }
}
