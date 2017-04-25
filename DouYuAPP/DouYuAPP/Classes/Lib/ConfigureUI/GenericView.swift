//
//  GenericView.swift
//  ContentView
//
//  Created by 李世洋 on 2017/3/12.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

public class GenericView: UIView, ConfigurableView {

    public required init() {
        super.init(frame: CGRect.zero)
        configureView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    // 子类重写该方法设置布局UI
    public func configureView() {
        backgroundColor = UIColor.white
    }
}
