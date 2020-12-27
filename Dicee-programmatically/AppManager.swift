//
//  AppManager.swift
//  Dicee-programmatically
//
//  Created by Sebastian Sciuba on 27/12/2020.
//

import Foundation

enum AppManager {
    static func setUserSeenAppInstructions() {
        UserDefaults.standard.set(true, forKey: "userSeenShowCase")
    }
    static func getUserSeenAppInstruction() -> Bool {
        let userSeenShowCaseObject = UserDefaults.standard.object(forKey: "userSeenShowCase")
        
        if let userSeenShowCase = userSeenShowCaseObject as? Bool {
            return userSeenShowCase
        }
        
        return false
    }
    
}
