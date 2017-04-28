
//
//  Yo_GameViewModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/1.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import ObjectMapper

class Yo_GameViewModel: NSObject {
    
    /// 加载游戏栏目数据
    ///
    /// - Parameter finishCallBack: 常见 全部 数据回调
    public func loadGameData(_ finishCallBack: @escaping (_: [Yo_GameModel], [Yo_GameModel]) -> ()) {
        
        LSYNetWorkTool.httpRequest(method: .get, url: GenerateUrl + "getColumnDetail", parmaters: ["shortName" : "game"], resultClass: Yo_BaseResultModel.self) { (success, failure) in
            
            if let success = success {
                if !success.error {
                    let gameModelArr = Mapper<Yo_GameModel>().mapArray(JSONArray: success.data!)
                    finishCallBack(Array(gameModelArr![0..<10]), gameModelArr!)
                }
            }
        }
    }
}
