//
//  LocalStorageUtility.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 23/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import UIKit

enum LocalStorageKeyConstant:String {
    case Name = "kName"
}

class LocalStorageUtility: BaseUtility {

    static func saveNameExample() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("sandeep_name_Example", forKey: LocalStorageKeyConstant.Name.rawValue)
        userDefaults.synchronize()
    }
    
    static func nameExample() -> String? {
        return (UserDefaults.standard.object(forKey: LocalStorageKeyConstant.Name.rawValue) as? String)
    }
}
