//
//  BaseViewController.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 17/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,NavigationItemProtocol {
    

//    // MARK: - Storyboard Details of View Controller
    class func storyboardName() -> String {
        return ""
    }
    
    class func storyboardIdentifier() -> String {
        return ""
    }
    
    class func storyboardNavigationControllerIdentifier() -> String {
        return ""
    }
    
    // MARK: - Life Cycle methods of View Controller
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navItemUIInfoObj = self.setupNavigationItemUI()
        if navItemUIInfoObj.isRequired {
            navigationItemUtil = NavigationItemUtility(controller: self)
        }else{
            navigationItemUtil = nil
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if ValidationUtility.isValidObject(paramObject:navigationItemUtil) {
            navigationItemUtil?.renderNavigation(paramNavItemUIInfoObj: navItemUIInfoObj)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation item related methods of View Controller
    
    var navigationItemUtil:NavigationItemUtility?
    //this object can't be nil as it contains vital info regarding navigation item ui
    var navItemUIInfoObj:NavigationItemUIInfo = NavigationItemUIInfo()
    
    func setupNavigationItemUI() -> NavigationItemUIInfo {
        let navItemUIInfoObj = NavigationItemUIInfo()
        navItemUIInfoObj.isRequired = true
        navItemUIInfoObj.isVisible = true
        
        return navItemUIInfoObj
    }
}
