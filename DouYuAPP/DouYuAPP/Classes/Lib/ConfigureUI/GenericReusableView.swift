//
//  GenericReusableView.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/31.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

class GenericReusableView: UICollectionReusableView, ConfigurableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    public required init() {
        super.init(frame: CGRect.zero)
        configureView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    func configureView() {
        backgroundColor = UIColor.white
    }
}
