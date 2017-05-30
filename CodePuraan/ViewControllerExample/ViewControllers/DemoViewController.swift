//
//  DemoViewController.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 18/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import UIKit

class DemoViewController: BaseViewController {

    // MARK: - Storyboard Details of View Controller
    override class func storyboardName() -> String {
        return "DemoVC"
    }
    
    override class func storyboardIdentifier() -> String {
        return "StoryboardIdDemo"
    }
    
    override class func storyboardNavigationControllerIdentifier() -> String {
        return "StoryboardIdDemoNavCntl"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.btnDismiss.isHidden = !showDismissButton
    }
    
    var showDismissButton:Bool = true
    @IBOutlet private weak var btnDismiss:UIButton!
    
    @IBAction func dismissMe(sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
