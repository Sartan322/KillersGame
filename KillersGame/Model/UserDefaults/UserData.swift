//
//   UserDefaults.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 05.02.2021.
//

import Foundation

final class UserData {
    
    private enum DefaultsKeys: String{
        case login
        case password
        case fullName
    }
    
    static var login: String! {
        get {
            return UserDefaults.standard.string(forKey: DefaultsKeys.login.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = DefaultsKeys.login.rawValue
            if let login = newValue {
                defaults.set(login, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    static var password: String! {
        get {
            return UserDefaults.standard.string(forKey: DefaultsKeys.password.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = DefaultsKeys.password.rawValue
            if let password = newValue {
                defaults.set(password, forKey: key)
                
            } else {
                defaults.removeObject(forKey: key)
                
            }
        }
    }
    static var fullName: String! {
        get {
            return UserDefaults.standard.string(forKey: DefaultsKeys.fullName.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = DefaultsKeys.fullName.rawValue
            if let fullName = newValue {
                defaults.set(fullName, forKey: key)
                
            } else {
                defaults.removeObject(forKey: key)
                
            }
        }
    }
    
    
}
