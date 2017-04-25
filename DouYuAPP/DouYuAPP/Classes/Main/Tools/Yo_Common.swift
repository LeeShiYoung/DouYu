//
//  Yo_Common.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/28.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import BCColor


let kStatusBarH : CGFloat = 20
let kNavigationBarH : CGFloat = 44
let kTabbarH : CGFloat = 44
let kTitleViewH : CGFloat = 40

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

let GenerateUrl = "http://capi.douyucdn.cn/api/v1/"

let baseContentViewName = "baseContentViewName"

struct LayoutScale {
    var kScaleW: CGFloat = 0.0
    var kScaleH: CGFloat = 0.0
    init() {
        kScaleW = kScreenW / 375
        kScaleH = kScreenH / 667
    }
    static let instance: LayoutScale = LayoutScale()
    static func width(_ distance: CGFloat) -> CGFloat {
        return distance * LayoutScale.instance.kScaleW
    }
    static func height(_ distance: CGFloat) -> CGFloat {
        return distance * LayoutScale.instance.kScaleH
        
    }
    
}
