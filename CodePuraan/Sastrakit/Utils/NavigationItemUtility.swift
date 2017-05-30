//
//  NavigationItemUtility.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 18/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import Foundation
import UIKit

class NavigationItemUIInfo {
    var isRequired:Bool = true
    var isVisible:Bool = true
    
    var tintColor:UIColor? = nil
    
    var barTintColor:UIColor? = nil
    
    var statusbarColor:UIColor? = nil
    
    var showDropShadow:Bool = false
}

class NavigationItemUtility {
    
    var controller:UIViewController
    var leftButtons:Array<UIButton>?
    var rightButtons:Array<UIButton>?
    var centerView:AnyObject?
    
    init(controller theController: UIViewController) {
        self.controller = theController
        self.leftButtons = [UIButton]()
        self.rightButtons = [UIButton]()
    }
    
    func addNavigationWithLeftButton(with buttonImage: UIImage? = nil, buttonText: String, textFont: UIFont, textColor: UIColor, buttonSelector: Selector? = nil, minimumWidth: CGFloat) -> UIButton {
        let leftButton = UIButton(type: .custom)
        var buttonWidth: CGFloat = 0.0
        var weight: Int = 0
        if nil != buttonImage {
            weight += 1
            buttonWidth += buttonImage!.size.width + 2.0
            leftButton.setImage(buttonImage, for: .normal)
        }
        if String.isValid(paramString: buttonText){
            weight += 1
            leftButton.setTitle(buttonText, for: .normal)
            leftButton.titleLabel?.font = textFont
            leftButton.titleLabel?.textColor = textColor
            buttonWidth += UIUtility.getSizeOf(buttonText, with: textFont).width
        }
        if nil != buttonSelector {
            leftButton.addTarget(self.controller, action: buttonSelector!, for: .touchUpInside)
        }
        if minimumWidth > 0.0 {
            buttonWidth = max(buttonWidth, minimumWidth)
        }
        if weight > 1 {
            leftButton.contentHorizontalAlignment = .left
            leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0)
            buttonWidth += 4
        }
        leftButton.frame = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: buttonWidth, height: CGFloat(44.0))
        self.leftButtons?.append(leftButton)
        return leftButton
    }
    
    func addNavigationRightButtonWithBadgeUI(with buttonImage: UIImage? = nil, withText buttonText: String, textFont: UIFont, textColor: UIColor, selector buttonSelector: Selector? = nil, withMinimumWidth minimumWidth: CGFloat) -> MIBadgeButton {
        let rightButton = MIBadgeButton(type: .custom)
        var buttonWidth: CGFloat = 0.0
        if nil != buttonImage {
            buttonWidth += buttonImage!.size.width + 2.0
            rightButton.setImage(buttonImage, for: .normal)
        }
        if String.isValid(paramString: buttonText) {
            rightButton.setTitle(buttonText, for: .normal)
            rightButton.titleLabel?.font = textFont
            rightButton.setTitleColor(textColor, for: .normal)
            buttonWidth += UIUtility.getSizeOf(buttonText, with: textFont).width
        }
        if nil != buttonSelector {
            rightButton.addTarget(self.controller, action: buttonSelector!, for: .touchUpInside)
        }
        if minimumWidth > 0.0 {
            buttonWidth = max(buttonWidth, minimumWidth)
        }
        
        //        rightButton.backgroundColor = UIColor.red
        
        rightButton.frame = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: buttonWidth, height: CGFloat(44.0))
        self.rightButtons?.append(rightButton)
        return rightButton
    }
    
    func addNavigationRightButton(with buttonImage: UIImage? = nil, withText buttonText: String, textFont: UIFont, textColor: UIColor, selector buttonSelector: Selector? = nil, withMinimumWidth minimumWidth: CGFloat) -> UIButton {
        let rightButton = UIButton(type: .custom)
        var buttonWidth: CGFloat = 0.0
        if nil != buttonImage {
            buttonWidth += buttonImage!.size.width + 2.0
            rightButton.setImage(buttonImage, for: .normal)
        }
        if String.isValid(paramString: buttonText) {
            rightButton.setTitle(buttonText, for: .normal)
            rightButton.titleLabel?.font = textFont
            rightButton.setTitleColor(textColor, for: .normal)
            buttonWidth += UIUtility.getSizeOf(buttonText, with: textFont).width
        }
        if nil != buttonSelector {
            rightButton.addTarget(self.controller, action: buttonSelector!, for: .touchUpInside)
        }
        if minimumWidth > 0.0 {
            buttonWidth = max(buttonWidth, minimumWidth)
        }
        
        //        rightButton.backgroundColor = UIColor.red
        
        rightButton.frame = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: buttonWidth, height: CGFloat(44.0))
        self.rightButtons?.append(rightButton)
        return rightButton
    }
    
    func addNavigationTitle(_ titleText: String, with titleFont: UIFont, withTextColor textColor: UIColor) -> UILabel {
        let textWidth: CGFloat = UIUtility.getSizeOf(titleText, with: titleFont).width
        
        let titleLabel = UILabel(frame: CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: textWidth, height: CGFloat(44.0)))
        titleLabel.textAlignment = .center
        titleLabel.textColor = textColor
        titleLabel.text = titleText
        titleLabel.font = titleFont
        self.centerView = titleLabel
        return titleLabel
    }
    
    func addNavigationTitleImage(_ titleImage: UIImage, withHeight imageViewHeight: CGFloat) -> UIImageView {
        var imageViewHeight = imageViewHeight
        if (imageViewHeight > 44.0) || (imageViewHeight <= 0.0) {
            imageViewHeight = 44.0
        }
        
        let imageViewWidth: CGFloat = (imageViewHeight * titleImage.size.width) / titleImage.size.height
        let titleImageView = UIImageView(frame: CGRect(x: CGFloat(0.0), y: CGFloat((44.0 - imageViewHeight) / 2), width: imageViewWidth, height: imageViewHeight))
        titleImageView.image = titleImage
        titleImageView.contentMode = .scaleAspectFit
        self.centerView = titleImageView
        return titleImageView
    }
    
    func renderNavigation(paramNavItemUIInfoObj:NavigationItemUIInfo) {
        
        if !paramNavItemUIInfoObj.isRequired {
            //if navigation bar is not initialized or not required then don't do anything
            return
        }
        
        var lBarButtons: [UIBarButtonItem] = []
        
        for btn in self.leftButtons! {
            lBarButtons.append(UIBarButtonItem(customView: btn as UIView))
        }
        
        var rBarButtons: [UIBarButtonItem] = []
        for btn in self.rightButtons! {
            rBarButtons.append(UIBarButtonItem(customView: btn as UIView))
        }
        
        self.controller.navigationItem.leftBarButtonItem = nil
        self.controller.navigationItem.backBarButtonItem = nil
        self.controller.navigationItem.rightBarButtonItems = nil
        self.controller.navigationItem.leftBarButtonItems = nil
        self.controller.navigationItem.titleView = nil
        
        self.controller.navigationItem.rightBarButtonItems = rBarButtons
        self.controller.navigationItem.leftBarButtonItems = lBarButtons
        self.controller.navigationItem.titleView = self.centerView as? UIView
        self.controller.navigationController?.setNavigationBarHidden(!paramNavItemUIInfoObj.isVisible, animated: false)
        self.controller.navigationController?.navigationBar.isHidden = !paramNavItemUIInfoObj.isVisible
        if ValidationUtility.isValidObject(paramObject: paramNavItemUIInfoObj.barTintColor) {
            self.controller.navigationController?.navigationBar.barTintColor = paramNavItemUIInfoObj.barTintColor!
        }
        
        if ValidationUtility.isValidObject(paramObject: paramNavItemUIInfoObj.tintColor) {
            self.controller.navigationController?.navigationBar.tintColor = paramNavItemUIInfoObj.tintColor!
        }
        self.controller.navigationItem.hidesBackButton = true
        
        
        if paramNavItemUIInfoObj.showDropShadow {
            self.controller.navigationController?.navigationBar.layer.masksToBounds = false
            self.controller.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
            self.controller.navigationController?.navigationBar.layer.shadowOpacity = 0.8
            self.controller.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            self.controller.navigationController?.navigationBar.layer.shadowRadius = 2
        }else{
            self.controller.navigationController?.navigationBar.layer.shadowColor = UIColor.clear.cgColor
            self.controller.navigationController?.navigationBar.layer.shadowOpacity = 0
            self.controller.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 0.0)
            self.controller.navigationController?.navigationBar.layer.shadowRadius = 0
        }
        
        
        self.controller.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.controller.navigationController?.navigationBar.shadowImage = UIImage()
        self.controller.navigationController?.navigationBar.isTranslucent = false
        self.controller.setNeedsStatusBarAppearanceUpdate()
    }

}
