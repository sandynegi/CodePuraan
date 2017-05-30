//
//  UIUtility.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 19/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import UIKit

class UIUtility: BaseUtility {
    
    class func getSizeOf(_ theString: String, with theFont: UIFont) -> CGSize {
        return UIUtility.getSizeOf(theString, with: theFont, withMaxWidth: CGFloat.greatestFiniteMagnitude, andWithMaxHeight: CGFloat.greatestFiniteMagnitude)
    }
    
    class func getSizeOf(_ theString: String, with theFont: UIFont, withMaxWidth maxWidth: CGFloat) -> CGSize {
        return UIUtility.getSizeOf(theString, with: theFont, withMaxWidth: maxWidth, andWithMaxHeight: CGFloat.greatestFiniteMagnitude)
    }
    
    class func getSizeOf(_ theString: String, with theFont: UIFont, withMaxHeight maxHeight: CGFloat) -> CGSize {
        return UIUtility.getSizeOf(theString, with: theFont, withMaxWidth: CGFloat.greatestFiniteMagnitude, andWithMaxHeight: maxHeight)
    }
    
    class func getSizeOf(_ theString: String, with theFont: UIFont, withMaxWidth maxWidth: CGFloat, andWithMaxHeight maxHeight: CGFloat) -> CGSize {
        let gotSize = theString.boundingRect(with: CGSize(width: maxWidth, height: maxHeight), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: theFont], context: nil).size
        return CGSize(width: CGFloat(ceilf(Float(gotSize.width))), height: CGFloat(ceilf(Float(gotSize.height))))
    }
    
    class func deviceWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    class func deviceHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    class func viewHeightByAutoLayout(_ paramView: UIView) -> CGFloat {
        paramView.setNeedsLayout()
        paramView.layoutIfNeeded()
        let size: CGSize = paramView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        return size.height + 1
    }
}
