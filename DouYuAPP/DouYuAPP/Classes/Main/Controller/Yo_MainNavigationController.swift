
//
//  Yo_MainNavigationController.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/14.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

class Yo_MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }

}
