//
//  Yo_AnchorBaseGroup.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/28.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import ObjectMapper

class Yo_AnchorBaseGroup: Mappable {
    var tag_name : String = ""
    var icon_url : String = ""
    
    var icon_name : String = "home_header_normal"
    //    lazy var anchors : [Yo_AnchorModel] = [Yo_AnchorModel]()
    
    var room_list: [Yo_AnchorModel]?
    
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    func mapping(map: Map) {
        tag_name <- map["tag_name"]
        icon_url <- map["icon_url"]
        icon_name <- map["icon_name"]
        room_list <- map["room_list"]
    }
}
