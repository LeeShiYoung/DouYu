//
//  Yo_HomeCycleModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/1.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import ObjectMapper

class Yo_HomeCycleModel: Mappable {
    // 标题
    var title : String = ""
    // 展示的图片地址
    var pic_url : String = ""
    // 主播信息对应的模型对象
    var room : Yo_AnchorModel?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        pic_url <- map["pic_url"]
        room <- map["room"]
     }
    
}
