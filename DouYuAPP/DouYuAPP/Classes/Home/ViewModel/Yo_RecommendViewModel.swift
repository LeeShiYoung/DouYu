//
//  Yo_RecommendViewModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/29.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import ObjectMapper

class Yo_RecommendViewModel: NSObject {
    
    public func loadRecommendData(_ finishCallBack: @escaping (_: [Yo_AnchorBaseGroup], [Yo_AnchorBaseGroup]) -> ()) {
        
        let dGroup = DispatchGroup()
        
        dGroup.enter()
        let paramerers = ["limit" : "4", "offset" : "0", "time" : Date.getCurrentTime()]
        LSYNetWorkTool.httpRequest(method: .get, url: GenerateUrl + "getbigDataRoom", parmaters: paramerers, resultClass: Yo_BaseResultModel.self) { (success, failure) in
            if let success = success {
                if !success.error {
                    self.bigDataRoomGroup.tag_name = "热门"
                    self.bigDataRoomGroup.icon_name = "home_header_hot"
                    let anchors = Mapper<Yo_AnchorModel>().mapArray(JSONArray: success.data!)
                    self.bigDataRoomGroup.room_list = anchors!
                }
            }
            dGroup.leave()
        }
        
        dGroup.enter()
        LSYNetWorkTool.httpRequest(method: .get, url: GenerateUrl + "getVerticalRoom", parmaters: paramerers, resultClass: Yo_BaseResultModel.self) { (success, failure) in
            if let success = success {
                if !success.error {
                    self.verticalRoomGroup.tag_name = "颜值"
                    self.verticalRoomGroup.icon_name = "home_header_phone"
                    let anchors = Mapper<Yo_AnchorModel>().mapArray(JSONArray: success.data!)
                    self.verticalRoomGroup.room_list = anchors!
                }
            }
            dGroup.leave()
        }
        
        dGroup.enter()
        LSYNetWorkTool.httpRequest(method: .get, url: GenerateUrl + "getHotCate", parmaters: paramerers, resultClass: Yo_BaseResultModel.self) { (success, failure) in
            if let success = success {
                self.gameGroups = Mapper<Yo_AnchorBaseGroup>().mapArray(JSONArray: success.data!)!
            }
            dGroup.leave()
        }
        
        dGroup.notify(queue: DispatchQueue.main){
            
            self.dataArray.insert(self.bigDataRoomGroup, at: 0)
            self.dataArray.append(self.verticalRoomGroup)
            self.dataArray.append(contentsOf: self.gameGroups)
            
            self.gameArray.append(contentsOf: self.dataArray)
            self.gameArray.remove(at: 0)
            self.gameArray.remove(at: 0)
            let moreGroup = Yo_AnchorBaseGroup()
            moreGroup.tag_name = "更多"
            self.gameArray.append(moreGroup)
            finishCallBack(self.dataArray, self.gameArray)
            
            Yo_MainNotification.postNotification(notification: .indicator)
        }
    }
    
    public func loadCycleData(_ finishCallBack: @escaping (_: [Yo_HomeCycleModel]?) -> ()) {
    
        LSYNetWorkTool.httpRequest(method: .get, url: "http://www.douyutv.com/api/v1/slide/6", parmaters: ["version" : "2.471"], resultClass: Yo_BaseResultModel.self) { (success, failure) in
            if let success = success {
                let cycleModelArray = Mapper<Yo_HomeCycleModel>().mapArray(JSONArray: success.data!)
                finishCallBack(cycleModelArray)
            }
        }
    }
    
    fileprivate lazy var bigDataRoomGroup: Yo_AnchorBaseGroup = {
        return Yo_AnchorBaseGroup()
    }()
    
    fileprivate lazy var verticalRoomGroup: Yo_AnchorBaseGroup = {
        return Yo_AnchorBaseGroup()
    }()
    
    fileprivate lazy var gameGroups: [Yo_AnchorBaseGroup] = {
        return [Yo_AnchorBaseGroup]()
    }()
    
    fileprivate lazy var dataArray: [Yo_AnchorBaseGroup] = {
       return [Yo_AnchorBaseGroup]()
    }()
    
    fileprivate lazy var gameArray: [Yo_AnchorBaseGroup] = {
        return [Yo_AnchorBaseGroup]()
    }()
}
