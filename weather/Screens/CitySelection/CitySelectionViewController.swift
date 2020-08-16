//
//  CitySelectionViewController.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit
import SnapKit

class CitySelectionViewController: CustomViewController {
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.extendedLayoutIncludesOpaqueBars = false
        searchController.searchBar.showsCancelButton = false
        UISearchBar.appearance().setImage(UIImage(), for: .clear, state: .normal)
        return searchController
    }()
    lazy var cityList: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self        
        return tableView
    }()
    let viewModel = CitySelectionViewModel()
    var selectedCity: CityModel?
    
    @UserDefault("registered_cities", value: [String]())
    var registeredCities: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup UI
        setupUI()
        // Setup cityList tableview
        setupTableView()
        // Setup observers
        setupFetchCityObserver()
        setupFilteredCityObserver()
        setupResetFilterObserver()
        // Fetch cities
        fetchCities()
    }
    
    fileprivate func setupUI(){
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Icons.leftBtn, style: .plain, target: self, action: #selector(handleBackBtnAction))
        navigationItem.titleView = searchController.searchBar
    }
    
    @objc
    fileprivate func handleBackBtnAction(){
        navigationController?.popViewController(animated: true)
    }
    
    fileprivate func setupTableView(){
        view.addSubview(cityList)
        cityList.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
    }
    
    fileprivate func fetchCities(){
        showLoading()
        viewModel.fetchCities()
    }
    
    fileprivate func setupFetchCityObserver(){
        viewModel.citiesDidLoad = { failure in
            if !failure {
                DispatchQueue.main.async {
                    self.hideLoading()
                    self.cityList.reloadData()
                }
            }
        }
    }
    
    fileprivate func setupFilteredCityObserver(){
        viewModel.citiesfiltered = {
            DispatchQueue.main.async {
                self.cityList.reloadData()
            }
        }
    }
    
    fileprivate func setupResetFilterObserver() {
           viewModel.didResetFilter = {
              DispatchQueue.main.async {
                 self.cityList.reloadData()
              }
           }
       }
    
    @objc
    fileprivate func handleAddButtonAction(_ sender: UIButton){
        let row = sender.tag
        guard let section = sender.accessibilityValue else { return }
        guard viewModel.cities.count > 0 else { return }
        let selectedCityModel = viewModel.cities[Int(section)!].cities[row]
        
        guard let registeredCities = registeredCities else { return }
        if registeredCities.count > 0 {
            self.registeredCities = registeredCities + [selectedCityModel.name]
        } else {
            self.registeredCities = [selectedCityModel.name]
        }
        cityList.reloadData()
    }
}


// MARK: UISearchBarDelegate
extension CitySelectionViewController: UISearchBarDelegate, UITextFieldDelegate {
 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            viewModel.filterCity(by: searchText)
        } else {
            viewModel.resetFilter()
        }
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension CitySelectionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard viewModel.cities.count > 0 else { return 0 }
        return viewModel.cities.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard viewModel.cities.count > 0 else { return 0 }
        return viewModel.cities[section].cities.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(viewModel.cities[section].letter)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let selectedCity = viewModel.cities[indexPath.section].cities[indexPath.row]
        cell.textLabel?.text = selectedCity.name
        
        if !(self.registeredCities?.contains(selectedCity.name) ?? false) {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
            let attributedString = NSAttributedString(string: "Ekle", attributes: [
                    .font: UIFont.robotoMedium(fontSize: 14),
                    .foregroundColor: Colors.purplyBlue!
            ])
            button.setAttributedTitle(attributedString, for: .normal)
            button.addTarget(self, action: #selector(handleAddButtonAction), for: .touchUpInside)
            button.tag = indexPath.row
            button.accessibilityValue = "\(indexPath.section)"
            cell.accessoryView = button
        }
        
        return cell
    }
    
    
}
