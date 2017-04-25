//
//  LSYUser.swift
//  SwiftProjectBaseFrame
//
//  Created by apple on 2017/2/10.
//  Copyright © 2017年 apple. All rights reserved.
//

import Foundation
import ObjectMapper

public class LSYUser: Mappable {
    
    // 用户名
    var userName: String?
    
    // 用户密码
    var userPassWord: String?
    
    var userID: String?
    
    var islogin = false
    
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        userName <- map["userName"]
        userPassWord <- map["userPassWord"]
        userID <- map["userID"]
        islogin <- map["islogin"]
    }
}


