//
//  Yo_AnchorModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/29.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import ObjectMapper

class Yo_AnchorModel: Mappable {
    /// 房间ID
    var room_id : String?
    /// 房间图片对应的URLString
    var vertical_src : String = ""
    /// 判断是手机直播还是电脑直播
    // 0 : 电脑直播(普通房间) 1 : 手机直播(秀场房间)
    var isVertical : Int = 0
    /// 房间名称
    var room_name : String = ""
    /// 主播昵称
    var nickname : String = ""
    /// 观看人数
    var online : Int = 0 {
        didSet{
            if online > 10000 {
                onlineFormat = "\(online / 10000)万在线"
            } else {
                onlineFormat = "\(online)在线"
            }
        }
    }
    /// 所在城市
    var anchor_city : String = ""
    
    var onlineFormat = ""
  
    var owner_uid : String?
    
        
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        room_id <- map["room_id"]
        vertical_src <- map["vertical_src"]
        isVertical <- map["isVertical"]
        room_name <- map["room_name"]
        nickname <- map["nickname"]
        online <- map["online"]
        anchor_city <- map["anchor_city"]
        owner_uid <- map["owner_uid"]
    }
}
