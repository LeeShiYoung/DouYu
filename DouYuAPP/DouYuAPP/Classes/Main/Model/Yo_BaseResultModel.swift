//
//  Yo_BaseResultModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/29.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import ObjectMapper

class Yo_BaseResultModel: Mappable {

    var error = false
    
    var data: [[String: Any]]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        error <- map["error"]
        data <- map["data"]
    }
}
