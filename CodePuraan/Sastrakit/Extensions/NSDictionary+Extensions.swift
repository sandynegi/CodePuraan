//
//  NSDictionary+Extensions.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 23/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import Foundation

extension NSDictionary {
    
    func toJSONString() -> String {
        var jsonString:String = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
            
            jsonString = String(data: jsonData, encoding: .utf8) ?? ""
            
        } catch {
            jsonString = ""
            print(error.localizedDescription)
        }
        return jsonString
    }
}
