//
//  Yo_RoomShowContentView.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/10.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import IJKMediaFramework

class Yo_RoomShowContentView: Yo_BaseContentView, Yo_MoviePlayerProtocol {

    override func configureView() {
        backgroundColor = UIColor.green
        
        
    }
    
    public var player: IJKFFMoviePlayerController?
}

extension Yo_RoomShowContentView {
    public func roomShowconfigurePlayer(liveString contentURLString: String?) {
        player = configurePlayer(contentURLString: contentURLString)
        player?.view.snp.makeConstraints({ (maker) in
            maker.left.right.top.bottom.equalTo(self)
        })
    }
}
