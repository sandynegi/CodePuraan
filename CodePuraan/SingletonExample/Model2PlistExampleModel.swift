//
//  Model2PlistExampleModel.swift
//  CodePuraan
//
//  Created by Sandeep Negi on 19/05/17.
//  Copyright © 2017 Sandeep Negi. All rights reserved.
//

import UIKit

class Model2PlistExampleModel: BaseModel {
    
//    private var internalObjectId:String = "" //this will be a differentiation property between object of this type
    
    var accessToken:String? = ""
    var expiresInSeconds:Int64? = 0
    
    required override init() {
        super.init()
    }
    
    required init(_ modal:Model2PlistExampleModel) {
        super.init()
        
        self.accessToken = modal.accessToken
        self.expiresInSeconds = modal.expiresInSeconds
    }
    
    func copyWithZone(_ zone: NSZone?) -> AnyObject {
        return type(of: self).init(self)
    }
    
    required init(dictOfSelf:NSMutableDictionary) {
        super.init(dictOfSelf: dictOfSelf)
        
        self.accessToken = dictOfSelf.object(forKey:"accessToken") as! String?
        self.expiresInSeconds = dictOfSelf.object(forKey:"expiresInSeconds") as! Int64?
    }
    
    override func dictionaryOfSelf() -> NSMutableDictionary {
        let selfDict:NSMutableDictionary = NSMutableDictionary()
        
        selfDict.setObject(self.accessToken!, forKey: "accessToken" as NSCopying)
        selfDict.setObject(self.expiresInSeconds!, forKey: "expiresInSeconds" as NSCopying)
        
        return selfDict
    }
    
    class func loadExample1Data(){
//        var example1Obj = Model2PlistExampleModel.loadModelFromStorage(paramFileName: "name")
        
        let example1Obj = Model2PlistExampleModel()
        example1Obj.accessToken = "sandeep negi"
        example1Obj.expiresInSeconds = 1234
        
        BaseModel.saveModelToStorage(paramFileName: "filename", fileType:.plist, paramObj: example1Obj, Model2PlistExampleModel.self)
        
        
        let loadedExample = BaseModel.loadModelFromStorage(paramFileName: "filename.plist", fileType:.plist, Model2PlistExampleModel.self)
        print("loadedExample.accessToken: \(loadedExample!.accessToken ?? "nothing good")!")
        
    }
    
    private func isTokenValid() -> Bool {
        let lastUpdateTimeDiffInSeconds:Int64 = Int64(NSDate().timeIntervalSince(NSDate.init(timeIntervalSinceReferenceDate: 24*60*60) as Date))
        
        if lastUpdateTimeDiffInSeconds < self.expiresInSeconds! {
            return true
        }else{
            UserDefaults.standard.removeObject(forKey: "accessTokenUpdateDate")
        }
        return false
    }
}
