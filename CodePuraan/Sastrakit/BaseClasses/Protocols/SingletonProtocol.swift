//
//  SingletonProtocol.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 17/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import Foundation

protocol SingletonProtocol {
    associatedtype T
    static var sharedInstance:T {get}
}
