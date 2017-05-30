//
//  HomeViewController.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 17/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: - Storyboard Details of View Controller
    override class func storyboardName() -> String {
        return "MainMenu"
    }
    
    override class func storyboardIdentifier() -> String {
        return "StoryboardIdMainMenu"
    }
    
    override class func storyboardNavigationControllerIdentifier() -> String {
        return "StoryboardIdHomeNavCntl"
    }
    
    
    // MARK: - Life Cycle methods of View Controller
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Model2PlistExampleModel.loadExample1Data()
    }
    
    // MARK: - Button actions 
    @IBAction func loadDemoVCWithoutNav(sender:UIButton) {
        let demoVC:DemoViewController = UIStoryboard.loadViewControllerByType(DemoViewController.self)
        demoVC.showDismissButton = false
        self.navigationController?.pushViewController(demoVC, animated: true)
    }
    
    @IBAction func loadDemoVCWithNav(sender:UIButton) {
        let demoNavCtrl:BaseNavigationController = UIStoryboard.loadViewControllerByType(DemoViewController.self, viaNavigationController: true)
        self.present(demoNavCtrl, animated: true, completion: nil)
    }

    
    // MARK: - Navigation item related methods of View Controller
    //Override this if any view controller required something different from pattern navigation item UI
    override func setupNavigationItemUI() -> NavigationItemUIInfo {
        let navItemUIInfoObj = NavigationItemUIInfo()
        navItemUIInfoObj.isRequired = true
        navItemUIInfoObj.isVisible = true
        
        return navItemUIInfoObj
    }
}
