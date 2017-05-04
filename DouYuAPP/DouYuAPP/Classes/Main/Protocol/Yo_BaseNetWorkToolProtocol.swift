//
//  Yo_BaseNetWorkToolProtocol.swift
//  DouYuAPP
//
//  Created by shying li on 2017/5/4.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import Foundation

protocol Yo_BaseNetWorkToolProtocol {
    static func handleStatusCode(code: Int?)
}

extension Yo_BaseNetWorkToolProtocol where Self: LSYBaseNetWorkTool {
    static func handleStatusCode(code: Int?) {
        if code == 200 {
            return
        }
        
        /// 处理 statusCode
        
    }
}
