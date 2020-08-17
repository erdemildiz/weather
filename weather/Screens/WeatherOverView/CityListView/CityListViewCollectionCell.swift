//
//  CityListViewCollectionCell.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit
import SnapKit

class CityListViewCollectionCell: UICollectionViewCell {
    
    static let cellIdentifier = "CityListViewCollectionCellIdentifier"
    var city: CityModel? {
        didSet {
            loadData()
        }
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.cornerRadius = 12.5
        return view
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.robotoMedium(fontSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Setup view
        setupUI()
        // Add Label
        addCityLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeCellActive(){
        containerView.backgroundColor = Colors.purplyBlue
        cityLabel.textColor = .white
    }
    
    func makeCellPassive(){
        containerView.backgroundColor = .white
        cityLabel.textColor = Colors.slate
    }
    
    fileprivate func setupUI(){
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.height.equalTo(contentView.snp.height)
            make.width.equalTo(contentView.snp.width)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    fileprivate func addCityLabel(){
        containerView.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { (make) in
          make.centerX.equalToSuperview()
          make.centerY.equalToSuperview()
        }
    }
    
    fileprivate func loadData(){
        guard let city = city else { return }
        cityLabel.text = city.name
    }
}
