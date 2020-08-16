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
    
    @objc
    fileprivate func handleAddButtonAction(){
        let citySelectionViewController = CitySelectionViewController()
        navigationController?.pushViewController(citySelectionViewController, animated: true)
    }
    
    @objc
    fileprivate func handleEditButtonAction(){
        
    }
    
}
