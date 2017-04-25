//
//  Yo_MainTabBarController.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/14.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import CYLTabBarController

class Yo_MainTabBarController: CYLTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        customizeTabBarForController()
        setupViewControllers()
        
    }
    

    // maerk: - 设置子试图
    func setupViewControllers() {
        let homeVC = Yo_HomeViewController()
        let homeNavi = Yo_MainNavigationController()
        homeNavi.addChildViewController(homeVC)
        
        let liveVC = Yo_LiveViewController()
        let liveNavi = Yo_MainNavigationController()
        liveNavi.addChildViewController(liveVC)
        
        let fllowVC = Yo_FllowViewController()
        let fllowNavi = Yo_MainNavigationController()
        fllowNavi.addChildViewController(fllowVC)
        
        let profileVC = Yo_ProfileViewController()
        let profileNavi = Yo_MainNavigationController()
        profileNavi.addChildViewController(profileVC)
        
        viewControllers = [homeNavi, liveNavi, fllowNavi, profileNavi]
    }

    func customizeTabBarForController() {
        
        let homeDic = [CYLTabBarItemTitle : "首页", CYLTabBarItemImage : "btn_home_normal", CYLTabBarItemSelectedImage : "btn_home_selected", NSForegroundColorAttributeName : [UIColor.orange]] as [String : Any]
        let livedIC = [CYLTabBarItemTitle : "直播", CYLTabBarItemImage : "btn_column_normal", CYLTabBarItemSelectedImage: "btn_column_selected"]
        let fllowDic  = [CYLTabBarItemTitle : "关注", CYLTabBarItemImage : "btn_live_normal", CYLTabBarItemSelectedImage: "btn_live_selected"]
        let profileDic  = [CYLTabBarItemTitle : "我的", CYLTabBarItemImage : "btn_user_normal", CYLTabBarItemSelectedImage: "btn_user_selected"]
        tabBarItemsAttributes = [homeDic, livedIC, fllowDic, profileDic]
    }
}
