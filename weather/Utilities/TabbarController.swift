//
//  TabbarController.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit

class CustomTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Tabbar
        setupTabbarItems()
    }
    
    fileprivate func setupTabbarItems(){
        
        // First tabbar
        let firstTabbarView = WeatherOverViewViewController()
        let firstTabbarItem = UITabBarItem(
            title: Constants.firstTabbarTitle,
            image: Icons.firstTabbarPassiveIcon,
            selectedImage: Icons.firstTabbarActiveIcon)
        firstTabbarView.tabBarItem = firstTabbarItem
        let firstTabbarNavigation = UINavigationController(rootViewController: firstTabbarView)
       
        // Second tabbar
        let secondTabbarView = CityListViewController()
        let secondTabbarItem = UITabBarItem(
            title: Constants.secondTabbarTitle,
            image: Icons.secondTabbarPassiveIcon,
            selectedImage: Icons.secondTabbarActiveIcon)
        secondTabbarView.tabBarItem = secondTabbarItem
        let secondTabbarNavigation = UINavigationController(rootViewController: secondTabbarView)
        
        self.viewControllers = [firstTabbarNavigation, secondTabbarNavigation]
    }
}
