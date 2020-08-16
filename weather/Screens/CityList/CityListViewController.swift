//
//  CityListViewController.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import SnapKit

class CityListViewController: CustomViewController {
    
    @UserDefault("registered_city_ids", value: [Int]())
    var registeredCities: [Int]?
    
    lazy var registeredCityList: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()        
        // Setup
        setupUI()
        // Setup Tableview
        setupTableView()
    
    }
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        title = Constants.cityListPageTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Icons.plus, style: .done, target: self, action: #selector(handleAddButtonAction))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: Constants.edit, style: .plain, target: self, action: #selector(handleEditButtonAction))
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([
            .font: UIFont.robotoRegular(fontSize: 14),
            .foregroundColor: Colors.purplyBlue!
        ], for: .selected)
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([
            .font: UIFont.robotoRegular(fontSize: 14),
            .foregroundColor: Colors.purplyBlue!
        ], for: .normal)
    }
    
    fileprivate func setupTableView(){
        view.addSubview(registeredCityList)
        registeredCityList.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc
    fileprivate func handleAddButtonAction(){
        let citySelectionViewController = CitySelectionViewController()
        navigationController?.pushViewController(citySelectionViewController, animated: true)
    }
    
    @objc
    fileprivate func handleEditButtonAction(){
        
    }
    
}

// MARK: TableviewDelegate & TableviewDataSource
extension CityListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let registeredCities = registeredCities else { return 0 }
        return registeredCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let registeredCities = registeredCities else { return cell }
        cell.textLabel?.text = "\(registeredCities[indexPath.row])"
        return cell
    }
}
