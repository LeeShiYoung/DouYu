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

        LSYNetWorkTool.httpRequest(method: .get, url: GenerateUrl + "getbigDataRoom", parmaters: paramerers, resultClass: Yo_BaseResultModel.self) { (result) in
            
            switch result {
            case .success(let baseResult):
                if !baseResult.error {
                    self.bigDataRoomGroup.tag_name = "热门"
                    self.bigDataRoomGroup.icon_name = "home_header_hot"
                    let anchors = Mapper<Yo_AnchorModel>().mapArray(JSONArray: baseResult.data!)
                    self.bigDataRoomGroup.room_list = anchors!
                } else {
                    // 抛出异常信息
                }
            case .failure(let error):
                print(error.localizedDescription)
                // 抛出错误信息
                break
            }
            dGroup.leave()
        }
        
        dGroup.enter()
        LSYNetWorkTool.httpRequest(method: .get, url: GenerateUrl + "getVerticalRoom", parmaters: paramerers, resultClass: Yo_BaseResultModel.self) { (result) in
            
            switch result {
            case .success(let baseResult):
                if !baseResult.error {
                    self.verticalRoomGroup.tag_name = "颜值"
                    self.verticalRoomGroup.icon_name = "home_header_phone"
                    let anchors = Mapper<Yo_AnchorModel>().mapArray(JSONArray: baseResult.data!)
                    self.verticalRoomGroup.room_list = anchors!
                } else {
                    // 抛出异常信息
                }
            case .failure(let error):
                print(error.localizedDescription)
                // 抛出错误信息
                break
            }
            dGroup.leave()
        }
        
        dGroup.enter()
        LSYNetWorkTool.httpRequest(method: .get, url: GenerateUrl + "getHotCate", parmaters: paramerers, resultClass: Yo_BaseResultModel.self) { (result) in
           
            switch result {
            case .success(let baseResult):
                if !baseResult.error {
                    self.gameGroups = Mapper<Yo_AnchorBaseGroup>().mapArray(JSONArray: baseResult.data!)!
                } else {
                    // 抛出异常信息
                }
            case .failure(let error):
                print(error.localizedDescription)
                // 抛出错误信息
                break
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
    
        LSYNetWorkTool.httpRequest(method: .get, url: "http://www.douyutv.com/api/v1/slide/6", parmaters: ["version" : "2.471"], resultClass: Yo_BaseResultModel.self) { (result) in
           
            switch result {
            case .success(let baseResult):
                if !baseResult.error {
                    let cycleModelArray = Mapper<Yo_HomeCycleModel>().mapArray(JSONArray: baseResult.data!)
                    finishCallBack(cycleModelArray)
                } else {
                    // 抛出异常信息
                }
            case .failure(let error):
                print(error.localizedDescription)
                // 抛出错误信息
                break
            }
        }
    }
    
    fileprivate lazy var bigDataRoomGroup = Yo_AnchorBaseGroup()
    fileprivate lazy var verticalRoomGroup = Yo_AnchorBaseGroup()
    fileprivate lazy var gameGroups = [Yo_AnchorBaseGroup]()
    fileprivate lazy var dataArray = [Yo_AnchorBaseGroup]()
    fileprivate lazy var gameArray = [Yo_AnchorBaseGroup]()
}
