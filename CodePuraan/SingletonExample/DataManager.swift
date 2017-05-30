//
//  DataManager.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 17/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import UIKit

class DataManager:SingletonProtocol  {

    //Must have private constructor
    private init() { }
    
    static let sharedInstance: DataManager = DataManager()
    
    func showMessage() {
        print("DataManager singleton check")
    }
}
