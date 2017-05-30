//
//  ValidationUtility.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 19/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import UIKit

class ValidationUtility: BaseUtility {

    static func isValidObject(paramObject:AnyObject?) -> Bool {
        return !(nil == paramObject || paramObject!.isKind(of: NSNull.self))
    }
    
}
