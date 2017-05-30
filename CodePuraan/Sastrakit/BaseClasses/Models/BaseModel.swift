//
//  BaseModel.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 17/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import UIKit

class BaseModel {
    
    init() {
    }
    
    required init(dictOfSelf:NSMutableDictionary) {
    }
    
    func dictionaryOfSelf() -> NSMutableDictionary {
        let selfDict:NSMutableDictionary = NSMutableDictionary()
        
        return selfDict
    }
    
    class func loadModelFromStorage<T:BaseModel>(paramFileName:String, fileType:LocalStorageFileType, _:T.Type) -> T? {
        
        var dataObj:T? = nil
        
        if String.isValid(paramString: paramFileName) {
            let filePath = paramFileName + fileType.rawValue
            let fullFilePath = FileUtility.documentDirectoryFilePath(ofFileName: filePath)
            if FileUtility.isFileExist(filePath: fullFilePath) {
                
                var dataDict:NSMutableDictionary!
                
                if fileType == .plist {
                    dataDict = NSMutableDictionary(contentsOfFile: fullFilePath)
                }else{
                    let jsonString:String? = FileUtility.stringContentFromFile(fileName: fullFilePath)
                    if String.isValid(paramString: jsonString) {
                        dataDict = NSMutableDictionary(dictionary: String.toNSDictionary(jsonText: jsonString!))
                    }
                }
                dataObj = T(dictOfSelf: dataDict.object(forKey: NSStringFromClass(T.self)) as! NSMutableDictionary)
            }
        }
        return dataObj
    }
    
    class func saveModelToStorage<T:BaseModel>(paramFileName:String, fileType:LocalStorageFileType, paramObj:T?, _:T.Type) {
        
        if String.isValid(paramString: paramFileName) && ValidationUtility.isValidObject(paramObject: paramObj) {
            let filePath = paramFileName + fileType.rawValue
            let fullFilePath = FileUtility.documentDirectoryFilePath(ofFileName: filePath)
            let rootDict:NSMutableDictionary = NSMutableDictionary()
            rootDict.setObject((paramObj!.dictionaryOfSelf()), forKey: NSStringFromClass(T.self) as NSCopying)
            
            if fileType == .plist {
                let flag:Bool = rootDict.write(toFile: fullFilePath, atomically: true)
                print("\(#function) flag:\(flag)")
            }else{
                FileUtility.saveStringContentToFile(content: rootDict.toJSONString(), fileName: fullFilePath)
            }
        }
    }
    
    class func clearModelFromStorage(paramFileName:String, fileType:LocalStorageFileType) {
        if String.isValid(paramString: paramFileName) {
            let filePath = paramFileName + fileType.rawValue
            let fullFilePath = FileUtility.documentDirectoryFilePath(ofFileName: filePath)
            do{
                try FileManager.default.removeItem(atPath: fullFilePath)
            }catch let error as NSError {
                print("\(#function)::Ooops! Something went wrong: \(error)")
            }
        }
    }
}
