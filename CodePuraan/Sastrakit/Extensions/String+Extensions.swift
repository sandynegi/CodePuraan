//
//  String+Extensions.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 19/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import Foundation

extension String {
    static func isValid(paramString:String?) -> Bool {
        return ValidationUtility.isValidObject(paramObject: paramString as AnyObject) && !paramString!.isEmpty
    }
        
    static func toNSDictionary(jsonText: String) -> NSDictionary {
        var dict:NSDictionary = [:]
        if let data = jsonText.data(using: .utf8) {
            do {
                let dictObj = try JSONSerialization.jsonObject(with: data, options: [])
                dict = (dictObj as? NSDictionary) ?? [:]
            } catch {
                dict = [:]
                print(error.localizedDescription)
            }
        }
        return dict
    }
}
