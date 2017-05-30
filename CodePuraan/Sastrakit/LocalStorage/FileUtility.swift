//
//  FileUtility.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 19/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import UIKit

class FileUtility: BaseUtility {

    static func documentDirectoryFilePath(ofFileName:String) -> String{
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fullFilePath = documentPath + "/" + ofFileName
        
        return fullFilePath
    }
    
    static func isFileExist(filePath:String) -> Bool {
        
        let fileManager = FileManager.default
        
        return fileManager.fileExists(atPath: filePath)
    }
    
    static func stringContentFromFile(fileName:String) -> String {
        let path = FileUtility.documentDirectoryFilePath(ofFileName: fileName)
        var readText : String = ""
        
        do {
            try readText = NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue) as String
        }catch let error as NSError {
            readText = ""
            print("ERROR : reading from file \(fileName) : \(error.localizedDescription)")
        }
        return readText
    }
    
    static func saveStringContentToFile(content:String, fileName:String) {
        if String.isValid(paramString: content) && String.isValid(paramString: fileName) {
            
            let path = FileUtility.documentDirectoryFilePath(ofFileName: fileName)
            do {
                try content.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            } catch let error as NSError {
                print("ERROR : writing to file \(path) : \(error.localizedDescription)")
            }
        }
    }
}
