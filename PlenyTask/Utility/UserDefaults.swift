//
//  UserDefaults.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import Foundation

var Defaults = UserDefaultsManager.shared

struct UserDefaultsManager {
    
    //MARK: - singleton manager
    
    static var shared = UserDefaultsManager()
    private init() {}
    let def = UserDefaults.standard
    
    //MARK: - computed properties
    
    // computed propery to check if the user isFirstTime or not
    var isFirstTime: Bool {
        set {
            def.set(newValue, forKey: UserDefaultsKeys.isFirstTime)
        } get {
            guard def.object(forKey: UserDefaultsKeys.isFirstTime) != nil else {
                return true
            }
            return def.object(forKey: UserDefaultsKeys.isFirstTime) as! Bool
        }
    }
    
    // computed propery for token
    var token: String {
        set {
            def.set(newValue, forKey: UserDefaultsKeys.token)
        } get {
            guard def.object(forKey: UserDefaultsKeys.token) != nil else {
                return ""
            }
            return def.object(forKey: UserDefaultsKeys.token) as! String
        }
    }
}










