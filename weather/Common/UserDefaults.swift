//
//  UserDefaults.swift
//  weather
//
//  Created by Erdem ILDIZ on 16.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    
    let key: String
    let value: T
    
    init(_ key: String, value: T) {
        self.key = key
        self.value = value
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? value
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
}
