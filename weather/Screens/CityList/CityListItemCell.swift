//
//  CityListItemCell.swift
//  weather
//
//  Created by Erdem ILDIZ on 16.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

class CityListItemCell: UITableViewCell {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = false
        view.layer.cornerRadius = 12
        return view
    }()
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 15
        return stackView
    }()
    lazy var cityAndDateStackView: UIStackView = {
       let stackView = UIStackView()
       stackView.alignment = .center
       stackView.axis = .vertical
       stackView.distribution = .fill
       stackView.spacing = 4
       return stackView
   }()
    lazy var deleteIcon: UIButton = {
        let deleteIcon = UIButton()
        deleteIcon.setImage(Icons.delete, for: .normal)
        deleteIcon.alpha = 0
        return deleteIcon
    }()
    lazy var weatherStatusImage: UIImageView = {
        let weatherStatusImage = UIImageView()
        weatherStatusImage.image = Icons.sunny
        return weatherStatusImage
    }()
    lazy var cityName: UILabel = {
        let cityName = UILabel()
        cityName.text = "Ankara"
        cityName.font = UIFont.robotoMedium(fontSize: 14)
        cityName.textAlignment = .left
        return cityName
    }()
    lazy var date: UILabel = {
        let date = UILabel()
        date.text = "7/27/2020"
        date.textColor = Colors.purplyBlue
        date.font = UIFont.robotoBold(fontSize: 12)
        return date
    }()
    lazy var degrees: UILabel = {
        let degrees = UILabel()
        degrees.text = "35°C"
        degrees.textColor = Colors.purplyBlue
        degrees.font = UIFont.robotoRegular(fontSize: 30)
        return degrees
    }()
    lazy var dragAndDropImage: UIImageView = {
        let dragAndDropImage = UIImageView()
        dragAndDropImage.image = Icons.dragDrop
        dragAndDropImage.alpha = 0
        return dragAndDropImage
    }()
    
    static let identifier = "CityListItemCellIdentifier"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Setup UI
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Contaraints
extension CityListItemCell {
    // MARK: Contraints
    fileprivate func setupUI(){
        // Container view
        setContainerViewConstaints()
        // Container stack
        setContainerStackViewConstaints()
        // Add Element to city and date stack view
        addElementToCityAndDateStack()
        // Add Container Stack
        addElementToContainerStack()
        // Set Elements size - width and height
        setElementsSize()
    }
    
    fileprivate func setContainerViewConstaints() {
        contentView.backgroundColor = Colors.backgroundGray
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(18)
            make.bottom.equalTo(0)
            make.right.equalTo(-16)
            make.left.equalTo(16)
        }
    }
    
    fileprivate func setContainerStackViewConstaints(){
        containerView.addSubview(containerStackView)
        containerStackView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.right.equalTo(-10)
            make.left.equalTo(10)
        }
    }
    
    fileprivate func addElementToCityAndDateStack(){
        cityAndDateStackView.addArrangedSubview(cityName)
        cityAndDateStackView.addArrangedSubview(date)
    }
    
    fileprivate func addElementToContainerStack(){
        containerStackView.addArrangedSubview(deleteIcon)
        containerStackView.addArrangedSubview(weatherStatusImage)
        containerStackView.addArrangedSubview(cityAndDateStackView)
        containerStackView.addArrangedSubview(degrees)
        containerStackView.addArrangedSubview(dragAndDropImage)
    }
    
    fileprivate func setElementsSize() {
        dragAndDropImage.snp.makeConstraints { (make) in
            make.width.equalTo(20)
            make.height.equalTo(12)
        }
        weatherStatusImage.snp.makeConstraints { (make) in
            make.width.equalTo(33)
            make.height.equalTo(33)
        }
        deleteIcon.snp.makeConstraints { (make) in
            make.width.equalTo(21)
            make.height.equalTo(21)
        }
        degrees.snp.makeConstraints { (make) in
            make.width.equalTo(66)
        }
        cityName.snp.makeConstraints { (make) in
            make.left.equalTo(31.5)
        }
    }
    
    //MARK: Actions
    func makeEditActionActive(){
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.deleteIcon.alpha = 1
            self?.dragAndDropImage.alpha = 1
        }
    }
    
    func makeEditActionPassive(){
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.deleteIcon.alpha = 0
            self?.dragAndDropImage.alpha = 0
        }
    }
}
