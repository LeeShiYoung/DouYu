//
//  GenericViewController.swift
//  ContentView
//
//  Created by 李世洋 on 2017/3/12.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

public class GenericViewController<View: GenericView>: UIViewController {

    public var contentView: View {
        return view as! View
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        automaticallyAdjustsScrollViewInsets = false
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public override func loadView() {
        view = View()
    }
}
