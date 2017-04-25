//
//  Yo_RoomNormalViewModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/21.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

protocol Yo_RoomNormalViewModelDelegate: NSObjectProtocol {
    func roomNormalViewModelFullScreen(controlView: UIView, Orientation: UIInterfaceOrientation)
}

class Yo_RoomNormalViewModel: NSObject {

    weak var delegate: Yo_RoomNormalViewModelDelegate?
    
    override init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.blockRotation = true
    }

    deinit {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.blockRotation = false
    }
}

extension Yo_RoomNormalViewModel {
    public func loadLiveUrl(live:(String) -> ()) {
        live("rtmp://192.168.4.205:1935/rtmplive/room")
    }
}

extension Yo_RoomNormalViewModel: Yo_portraitLiveControlViewDelegate, Yo_landscapeLiveControlViewDelegate {
    
    func portraitLiveControlViewDidClickFullScreenBtn(controlView: Yo_portraitLiveControlView, Orientation: UIInterfaceOrientation) {
        UIDevice.current.setValue(Orientation.rawValue, forKey: "orientation")
        delegate?.roomNormalViewModelFullScreen(controlView: controlView, Orientation: Orientation)
    }
    
    func landscapeLiveControlViewDidClickBackBtn(landscapeView: Yo_landscapeLiveControlView, Orientation: UIInterfaceOrientation) {
        UIDevice.current.setValue(Orientation.rawValue, forKey: "orientation")
        delegate?.roomNormalViewModelFullScreen(controlView: landscapeView, Orientation: Orientation)
    }
}
