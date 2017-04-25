//
//  Yo_landscapeLiveControlView.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/21.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol Yo_landscapeLiveControlViewDelegate: NSObjectProtocol {
    func landscapeLiveControlViewDidClickBackBtn(landscapeView: Yo_landscapeLiveControlView, Orientation: UIInterfaceOrientation)
}
class Yo_landscapeLiveControlView: GenericView {

    weak var delegate: Yo_landscapeLiveControlViewDelegate?
    
    fileprivate lazy var disposeBag = DisposeBag()
    
    fileprivate lazy var touched = false
    
    override func configureView() {
        setupUI()
        bindFunction()
        
    }
    
    fileprivate lazy var topToolView: UIView = {[weak self] in
        let topToolView = UIView()
        self?.addSubview(topToolView)
        topToolView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return topToolView
    }()
    
    fileprivate lazy var bottomToolView: UIView = {[weak self] in
        let bottomToolView = UIView()
        self?.addSubview(bottomToolView)
        bottomToolView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return bottomToolView
    }()
    
    fileprivate lazy var backBtn: UIButton = {[weak self] in
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "btn_back_20x20_"), for: .normal)
        backBtn.setImage(UIImage(named: "btn_back_20x20_"), for: .highlighted)
        self?.topToolView.addSubview(backBtn)
        return backBtn
        }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let showAnimate = {
            UIView.animate(withDuration: 0.2) {
                self.topToolView.alpha = 0
                self.bottomToolView.alpha = 0
            }
        }
        
        let hideAnimate = {
            UIView.animate(withDuration: 0.2) {
                self.topToolView.alpha = 1
                self.bottomToolView.alpha = 1
            }
        }
        
        touched ? hideAnimate() : showAnimate()
        touched = !touched
    }
}

extension Yo_landscapeLiveControlView {
    fileprivate func bindFunction() {
        backBtn.bindFunction(disposable: disposeBag) {[weak self] in
            self?.delegate?.landscapeLiveControlViewDidClickBackBtn(landscapeView: self!, Orientation: .portrait)
        }
    }
}

extension Yo_landscapeLiveControlView {
    fileprivate func setupUI() {
        topToolView.snp.makeConstraints { (maker) in
            maker.left.right.top.equalTo(self)
            maker.height.equalTo(50)
        }
        backBtn.snp.makeConstraints { (maker) in
            maker.left.equalTo(topToolView.snp.left).offset(15)
            maker.bottom.equalTo(topToolView.snp.bottom).offset(-12)
        }
        
        bottomToolView.snp.makeConstraints { (maker) in
            maker.left.right.bottom.equalTo(self)
            maker.height.equalTo(50)
        }
    }
}
