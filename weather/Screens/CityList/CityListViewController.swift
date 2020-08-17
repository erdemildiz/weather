//
//  CityListViewController.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import SnapKit

class CityListViewController: CustomViewController {
    
    var isEditActionActive: Bool = false
    
    lazy var registeredCityList: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = Colors.backgroundGray
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    let viewModel = CityListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()        
        // Setup
        setupUI()
        // Setup Tableview
        setupTableView()
        // Register Cell
        registerCell()
        // Setup cities weather observer
        addFetchedCitiesWeatherInfosObserver()
        
        viewModel.fetchCitiesWeatherInfos()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Check registred cities and fetch weather infos
        viewModel.fetchCitiesWeatherInfos()
    }
    
    fileprivate func setupUI() {
        view.backgroundColor = Colors.backgroundGray
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
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.bottom.equalTo(-50)
            make.centerX.equalToSuperview()
        }
    }
    
    fileprivate func registerCell() {
        registeredCityList.register(CityListItemCell.self, forCellReuseIdentifier: CityListItemCell.identifier)
    }
    
    @objc
    fileprivate func handleAddButtonAction(){
        let citySelectionViewController = CitySelectionViewController()
        navigationController?.pushViewController(citySelectionViewController, animated: true)
    }
    
    @objc
    fileprivate func handleEditButtonAction(){
        isEditActionActive.toggle()
        navigationItem.leftBarButtonItem?.title = isEditActionActive ? Constants.done : Constants.edit
        registeredCityList.reloadData()
    }
    
    fileprivate func addFetchedCitiesWeatherInfosObserver(){
        viewModel.citiesWeatherDidLoad = { failure in
            if !failure {
                DispatchQueue.main.async {
                    self.registeredCityList.reloadData()
                }
            }
        }
    }   
    
    
}

// MARK: TableviewDelegate & TableviewDataSource
extension CityListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let citiesWeathers = viewModel.citiesWeathers else { return 0 }
        return citiesWeathers.cnt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityListItemCell.identifier) as? CityListItemCell else { return UITableViewCell() }
        // Edit action control
        if isEditActionActive {
            cell.makeEditActionActive()
        } else {
            cell.makeEditActionPassive()
        }
        
        guard let citiesWeathers = viewModel.citiesWeathers else { return cell }
        cell.cityInfo = citiesWeathers.list[indexPath.row]
        
        return cell
    }
}
