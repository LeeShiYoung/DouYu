//
//  Yo_BaseContentView.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/28.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Yo_BaseContentView: GenericView {
    
    public let disposeBag = DisposeBag()
    override func configureView() {
        super.configureView()
        
        addNotifitionCenter()
    }
    
    @objc fileprivate func stopAnimation() {
        self.stopAnimations()
    }
}

extension Yo_BaseContentView: AddIndicatorViewProtocol {
    
    fileprivate func addNotifitionCenter() {
        
        Yo_MainNotification.addObserver(observer: self, selector: .stopAnimations, notification: .indicator)
    }
}

private extension Selector {
   static let stopAnimations = #selector(Yo_BaseContentView.stopAnimation)
}
