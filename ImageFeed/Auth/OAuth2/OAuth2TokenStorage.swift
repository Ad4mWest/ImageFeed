//  OAuth2TokenStorage.swift
//  ImageFeed
//  Created by Adam West on 29.06.23.

import Foundation

struct OAuth2TokenStorage {
    static var shared = OAuth2TokenStorage()
    private let userDefaults = UserDefaults.standard
    private enum Keys: String {
        case tokenKey
    }
    
    var token: String? {
        get {
            return userDefaults.string(forKey: Keys.tokenKey.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Keys.tokenKey.rawValue)
        }
    }
}
