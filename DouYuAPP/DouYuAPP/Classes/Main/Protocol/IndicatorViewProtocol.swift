//
//  IndicatorViewProtocol.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/11.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import SnapKit

protocol AddIndicatorViewProtocol {
    func addIndicatorView()
    func stopAnimations()
    
}

extension AddIndicatorViewProtocol where Self: UIView {
    
    func addIndicatorView() {
        
        let animImageView = InDicatorView(image: UIImage(named: "img_loading_1"))
        animImageView.animationImages = [UIImage(named : "img_loading_1")!, UIImage(named : "img_loading_2")!]
        animImageView.animationDuration = 0.5
        animImageView.animationRepeatCount = LONG_MAX
        animImageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        
        animImageView.isHidden = false
        addSubview(animImageView)
        animImageView.snp.makeConstraints { (maker) in
            maker.centerX.centerY.equalTo(self)
        }
        animImageView.startAnimating()
    }
    
    func stopAnimations() {
        
        guard let indicatorView = subviews.filter({ $0.isKind(of: InDicatorView.self) }).first as! UIImageView? else { return }
        
        indicatorView.isHidden = true
        indicatorView.stopAnimating()
        indicatorView.removeFromSuperview()
    }
}

class InDicatorView: UIImageView {

    deinit {
        print("dealloc")
    }
}
