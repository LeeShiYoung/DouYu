//
//  LSYUserTool.swift
//  SwiftProjectBaseFrame
//
//  Created by apple on 2017/2/10.
//  Copyright © 2017年 apple. All rights reserved.
//

import Foundation
import KeychainAccess


public class LSYUserTool {
    
    static let keyChain = Keychain(service: "myServiceKey")
    
    // MARK: 保存用户
    public class func save(userAccount account: LSYUser) {
        
        let userJson = account.toJSON()
        let userData = NSKeyedArchiver.archivedData(withRootObject: userJson)
        
        do {
            try keyChain.set(userData, key: account.userID!)
        } catch {
            print(error)
        }
        
    }
    
    // MARK: 获取当前登录的用户
    public class func getLoginUserAccount() -> LSYUser? {
        
        let userArr = getAllUserAccounts()
        for user in userArr {
            if user.islogin {
                return user
            }
        }
        return nil
    }
    
    // MARK: 获取所有用户
    public class func getAllUserAccounts() -> [LSYUser] {
        var allAcount = [LSYUser]()
        let allKeys = keyChain.allKeys()
        
        for key in allKeys {
            do {
                let userData = try keyChain.getData(key)
                let userJson = NSKeyedUnarchiver.unarchiveObject(with: userData!)
                if let userJson = userJson {
                    let user = LSYUser(JSON: userJson as! [String: Any])
                    if let user = user {
                        allAcount.append(user)
                    }
                }
                
            } catch {
                print(error)
            }
        }
        return allAcount
    }
    
    // MARK: 删除已登录用户外的所有用户
    public class func removeUserAccountsOutsideLogin() {
        let userArr = getAllUserAccounts()
        for user in userArr {
            if !user.islogin {
                do {
                    try keyChain.remove(user.userID!)
                } catch {
                    print(error)
                }
            }
        }
    }
   
}

