//
//  Yo_MoviePlayerProtocol.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/20.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import IJKMediaFramework
import SnapKit

protocol Yo_MoviePlayerProtocol {
    func configurePlayer(contentURLString: String?) -> IJKFFMoviePlayerController?
}

extension Yo_MoviePlayerProtocol where Self: UIView {
    func configurePlayer(contentURLString: String?) -> IJKFFMoviePlayerController? {
        
        guard let liveString = contentURLString else { return nil }
        let options = IJKFFOptions.byDefault()
        options?.setOptionIntValue(1, forKey: "videotoolbox", of: kIJKFFOptionCategoryPlayer)
        let player = IJKFFMoviePlayerController(contentURLString: liveString, with: options)
        player?.view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        return player
    }
}

