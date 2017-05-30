//
//  UserManager.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 17/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import Foundation

class UserManager:SingletonProtocol {
    
    //Must have private constructor
    private init() { }
    
    static let sharedInstance: UserManager = UserManager()
    
    func showMessage() {
        print("UserManager singleton check")
    }
}
