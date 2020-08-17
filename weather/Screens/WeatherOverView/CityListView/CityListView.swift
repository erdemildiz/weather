//
//  CityListView.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

protocol CityListViewDelegate: AnyObject {
    func didSelectCity(city: CityModel)
}

class CityListView: UICollectionView {
    
    var cities = [CityModel]()
    var activeCity: CityModel?
    weak var cityListDelegate: CityListViewDelegate?
   
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        // Setup UI Element musts
        setup()
        // Register
        registerCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
       self.delegate = self
       self.dataSource = self
       self.showsHorizontalScrollIndicator = false
       self.backgroundColor = .clear
    }
   
    
    fileprivate func registerCell(){
        self.register(CityListViewCollectionCell.self, forCellWithReuseIdentifier: CityListViewCollectionCell.cellIdentifier)
    }
    
}

// MARK: Collection delegate and datasource
extension CityListView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard cities.count > 0 else { return 0 }
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityListViewCollectionCell.cellIdentifier, for: indexPath) as? CityListViewCollectionCell else { return UICollectionViewCell() }
        
        guard cities.count > 0 else { return cell }
        guard let activeCity = activeCity else { return cell }
        cell.city = cities[indexPath.row]
        if activeCity.id ==  cities[indexPath.row].id {
            cell.makeCellActive()
        } else {
            cell.makeCellPassive()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cityListDelegate = cityListDelegate else { return }
        guard cities.count > 0 else { return }
        cityListDelegate.didSelectCity(city: cities[indexPath.row])
    }
    
}


