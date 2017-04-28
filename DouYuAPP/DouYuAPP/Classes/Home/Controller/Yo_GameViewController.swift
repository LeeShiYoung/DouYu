//
//  Yo_GameViewController.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/28.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit


class Yo_GameViewController: GenericViewController<Yo_GameContentView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGameData()
    }
    
    fileprivate lazy var gameViewModel = Yo_GameViewModel()
}

extension Yo_GameViewController {
    
    fileprivate func loadGameData() {
        gameViewModel.loadGameData { (commonGame, allGame) in
            
            
        }
    }
}
