
//
//  Yo_HomeCycleView.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/1.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import FSPagerView

class Yo_HomeCycleView: FSPagerView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        register(FSPagerViewCell.self, forCellWithReuseIdentifier: cycleViewCellID)
        itemSize = .zero
        automaticSlidingInterval = 3.0
        
        addSubview(pageControl)
        pageControl.snp.makeConstraints { (maker) in
            maker.bottom.left.right.equalTo(self)
            maker.height.equalTo(20)
        }
    }
    
    public lazy var pageControl: FSPageControl = {
        let pageControl = FSPageControl()
        pageControl.contentHorizontalAlignment = .right
        pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
        pageControl.setFillColor(UIColor.orange, for: .selected)
        return pageControl
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
