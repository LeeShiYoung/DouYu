//
//  Yo_BaseSectionHeaderView.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/31.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

class Yo_BaseSectionHeaderView: GenericReusableView, Yo_BaseCollectionViewProtocol {

    override func configureView() {
        super.configureView()
        
        setupUI()
    }
    
    public lazy var headerIcon: UIImageView = {[weak self] in
        let headerIcon = UIImageView()
        self?.addSubview(headerIcon)
        return headerIcon
        }()
    
    public lazy var sectionName: UILabel = {[weak self] in
        let sectionName = UILabel()
        sectionName.font = UIFont.systemFont(ofSize: 16)
        sectionName.textColor = UIColor.colorWithHex("#020202")
        self?.addSubview(sectionName)
        return sectionName
        }()
}

extension Yo_BaseSectionHeaderView {
    fileprivate func setupUI() {
    
        headerIcon.snp.makeConstraints { (maker) in
            maker.left.equalTo(self.snp.left).offset(10)
            maker.centerY.equalTo(self.snp.centerY).offset(5)
        }
        
        sectionName.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(headerIcon.snp.centerY)
            maker.left.equalTo(headerIcon.snp.right).offset(5)
        }
    }
    
    func configure(Item: Any, indexPath: IndexPath) {
        
    }
}
