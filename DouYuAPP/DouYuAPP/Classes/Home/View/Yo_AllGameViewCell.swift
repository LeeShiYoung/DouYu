//
//  Yo_AllGameViewCell.swift
//  DouYuAPP
//
//  Created by shying li on 2017/5/2.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit 

class Yo_AllGameViewCell: Yo_CommonGameViewCell {

    fileprivate lazy var bottomLineView: UIView = {[weak self] in
        let bottomLineView = UIView()
        bottomLineView.backgroundColor = UIColor.colorWithHex("#c9cacd")
        self?.addSubview(bottomLineView)
        return bottomLineView
    }()

    override func configureView() {
        super.configureView()
        
        bottomLineView.snp.makeConstraints { (maker) in
            maker.bottom.left.right.equalTo(self)
            maker.height.equalTo(0.5)
        }
    }
}
