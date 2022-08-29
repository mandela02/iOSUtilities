//
//  Settings.swift
//  Hamyabi
//
//  Created by TriBQ on 15/12/2021.
//

import Foundation

public struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    private let userDefault: UserDefaults?
    
    public init(store: String, key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
        self.userDefault = UserDefaults(suiteName: store)
    }
    
    public var value: T {
        get {
            if let value = userDefault?.object(forKey: key) as? T {
                return value
            } else {
                userDefault?.set(defaultValue, forKey: key)
                userDefault?.synchronize()
                return defaultValue
            }
        }
        set {
            userDefault?.set(newValue, forKey: key)
            userDefault?.synchronize()
        }
    }
}
