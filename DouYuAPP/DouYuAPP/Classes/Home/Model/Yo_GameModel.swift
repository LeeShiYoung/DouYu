//
//  Yo_GameModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/28.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import ObjectMapper

class Yo_GameModel: Mappable {

    var tag_name : String = ""
    var icon_url : String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        tag_name <- map["tag_name"]
        icon_url <- map["icon_url"]
    }
}
