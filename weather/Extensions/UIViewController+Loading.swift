//
//  UIViewController+Loading.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import UIKit
import SnapKit

class CustomViewController: UIViewController {
    
    lazy var loading: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        return loading
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoading()
    }
    
    fileprivate func setupLoading() {
        view.addSubview(loading)
        loading.snp.makeConstraints({ (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        })
    }
    
    func showLoading(){
        self.loading.startAnimating()
    }
    
    func hideLoading(){
        DispatchQueue.main.async {
            self.loading.stopAnimating()
        }
    }
    
}
