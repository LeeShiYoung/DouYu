//
//  Yo_HomeSectionHeaderView.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/31.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

class Yo_HomeSectionHeaderView: Yo_BaseSectionHeaderView {
    
    override func configureView() {
        super.configureView()
        
        setupUI()
    }
    
    fileprivate lazy var moreBtn: UIButton = {[weak self] in
        let moreBtn = UIButton(type: .custom)
        moreBtn.setTitle("更多 >", for: .normal)
        moreBtn.setTitleColor(UIColor.colorWithHex("#5c5e66"), for: .normal)
        moreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self?.addSubview(moreBtn)
        return moreBtn
    }()
    
    
}

extension Yo_HomeSectionHeaderView {
    fileprivate func setupUI() {
        
        
        moreBtn.snp.makeConstraints { (maker) in
            maker.right.equalTo(self.snp.right).offset(-10)
            maker.centerY.equalTo(sectionName.snp.centerY)
        }
    }
}

extension Yo_HomeSectionHeaderView {

    override func configure(Item: Any, indexPath: IndexPath) {
        let model = Item as? Yo_AnchorBaseGroup
        headerIcon.image = UIImage(named: (model?.icon_name)!)
        sectionName.text = model?.tag_name
    }
    
}
