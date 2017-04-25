//
//  Yo_portraitLiveControlView.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/21.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol Yo_portraitLiveControlViewDelegate: NSObjectProtocol {
    func portraitLiveControlViewDidClickFullScreenBtn(controlView: Yo_portraitLiveControlView, Orientation: UIInterfaceOrientation)
}

class Yo_portraitLiveControlView: GenericView {
    
    weak var delegate: Yo_portraitLiveControlViewDelegate?
    
    fileprivate let disposebag = DisposeBag()
    
    override func configureView() {
        setupUI()
        
        fullScreenBtn.bindFunction(disposable: disposebag, subscribe: {[weak self] in
            self?.delegate?.portraitLiveControlViewDidClickFullScreenBtn(controlView: self!, Orientation: .landscapeRight)
        })
    }
    
    fileprivate lazy var fullScreenBtn: UIButton = {[weak self] in
        let fullScreenBtn = UIButton(type: .custom)
        fullScreenBtn.setImage(UIImage(named: "btn_vdo_full_36x36_"), for: .normal)
        fullScreenBtn.setImage(UIImage(named: "btn_vdo_full_click_36x36_"), for: .highlighted)
        self?.addSubview(fullScreenBtn)
        return fullScreenBtn
        }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

extension Yo_portraitLiveControlView {
    fileprivate func setupUI() {
        fullScreenBtn.snp.remakeConstraints { (maker) in
            maker.bottom.equalTo(self.snp.bottom).offset(-6)
            maker.right.equalTo(self.snp.right).offset(-6)
        }
    }
}
