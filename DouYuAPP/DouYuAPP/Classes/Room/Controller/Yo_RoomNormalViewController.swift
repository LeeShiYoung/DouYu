//
//  Yo_RoomNormalViewController.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/10.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import FDFullscreenPopGesture

class Yo_RoomNormalViewController: GenericViewController<Yo_RoomNormalContentView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fd_prefersNavigationBarHidden = true
        
        roomNormalViewModel.loadLiveUrl { (liveUrl) in
            contentView.roomNormalconfigurePlayer(liveString: liveUrl)
            contentView.player?.prepareToPlay()
        }
        
        contentView.portraitLiveControlView.delegate = roomNormalViewModel
        contentView.landscapeLiveControlView.delegate = roomNormalViewModel
    }
    
    fileprivate lazy var roomNormalViewModel: Yo_RoomNormalViewModel = {[weak self] in
        let roomNormalViewModel = Yo_RoomNormalViewModel()
        roomNormalViewModel.delegate = self
        return roomNormalViewModel;
    }()
    
    override func viewDidDisappear(_ animated: Bool) {
      
        super.viewWillDisappear(animated)
        contentView.player?.shutdown()
    }
}

extension Yo_RoomNormalViewController: Yo_RoomNormalViewModelDelegate {
    
    func roomNormalViewModelFullScreen(controlView: UIView, Orientation: UIInterfaceOrientation) {
        
        switch Orientation {
        case .landscapeRight:
            fd_interactivePopDisabled = true
            // 设置横屏UI
            contentView.landscapeUI()
        case .portrait:
            // 设置竖屏
            fd_interactivePopDisabled = false
            contentView.portraitUI()
        default:
            break
        }
    }
}
