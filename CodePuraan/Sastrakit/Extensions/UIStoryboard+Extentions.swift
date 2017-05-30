//
//  UIStoryboard+Extentions.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 17/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard  {
    class func loadViewControllerByType<T:BaseViewController, U:UIViewController>(_: T.Type, viaNavigationController:Bool? = false) -> U {
        let storyboardObj = UIStoryboard(name: T.storyboardName(), bundle: nil)
        if true == viaNavigationController {
            return storyboardObj.instantiateViewController(withIdentifier: T.storyboardNavigationControllerIdentifier()) as! U
        }else{
            return storyboardObj.instantiateViewController(withIdentifier: T.storyboardIdentifier()) as! U
        }
    }
}
