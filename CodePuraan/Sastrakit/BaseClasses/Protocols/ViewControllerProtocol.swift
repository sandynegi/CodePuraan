//
//  ViewControllerProtocol.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 17/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import UIKit

@objc protocol ViewControllerProtocol{
    static var storyboardName:String{get}
    
    @objc optional
    static var storyboardIdentifier:String{get}
    
    @objc optional
    static var storyboardNavigationControllerIdentifier:String{get}
}
