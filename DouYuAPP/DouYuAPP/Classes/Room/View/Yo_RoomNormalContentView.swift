//
//  Yo_RoomNormalContentView.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/10.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import IJKMediaFramework

class Yo_RoomNormalContentView: Yo_BaseContentView, Yo_MoviePlayerProtocol {

    override func configureView() {
        backgroundColor = UIColor.orange
       
        portraitUI()
    }
    
    
    public var player: IJKFFMoviePlayerController?
    
    fileprivate lazy var backCoverView: UIView = {[weak self] in
        let backCoverView = UIView()
        backCoverView.backgroundColor = UIColor.black
        self?.addSubview(backCoverView)
        return backCoverView
        }()
    
    public lazy var portraitLiveControlView: Yo_portraitLiveControlView = {
        let portraitLiveControlView = Yo_portraitLiveControlView()
        return portraitLiveControlView
        }()
    
    public lazy var landscapeLiveControlView: Yo_landscapeLiveControlView = {
        let landscapeLiveControlView = Yo_landscapeLiveControlView()
        return landscapeLiveControlView
    }()
    
}


extension Yo_RoomNormalContentView {
    public func roomNormalconfigurePlayer(liveString contentURLString: String?) {
        
        player = configurePlayer(contentURLString: contentURLString)
        backCoverView.insertSubview((player?.view)!, at: 0)
        player?.view.snp.makeConstraints({ (maker) in
            maker.left.right.top.bottom.equalTo(backCoverView)
        })
    }
}

extension Yo_RoomNormalContentView {
    // 竖屏
    public func portraitUI() {
        landscapeLiveControlView.removeFromSuperview()
        
        backCoverView.snp.remakeConstraints { (maker) in
            maker.left.right.top.equalTo(self)
            maker.height.equalTo(kScreenW * CGFloat(9.0/16.0))
        }
        
        backCoverView.addSubview(portraitLiveControlView)
        portraitLiveControlView.snp.makeConstraints { (maker) in
            maker.left.right.bottom.top.equalTo(backCoverView)
        }
    }
    
    // 横屏
    public func landscapeUI() {
        portraitLiveControlView.removeFromSuperview()
        
        backCoverView.snp.remakeConstraints { (maker) in
            maker.left.right.top.bottom.equalTo(self)
        }
        
        backCoverView.addSubview(landscapeLiveControlView)
        landscapeLiveControlView.snp.makeConstraints { (maker) in
            maker.left.right.bottom.top.equalTo(backCoverView)
        }
    }
}

