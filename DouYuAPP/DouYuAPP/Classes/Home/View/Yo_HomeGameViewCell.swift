//
//  Yo_HomeGameViewCell.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/1.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit


class Yo_HomeGameViewCell: Yo_BaseCollectionViewCell {
    
    override func configureView() {
        super.configureView()
        setupUI()
    }
    
    public lazy var gameName: UILabel = {[weak self] in
        let gameName = UILabel()
        gameName.textColor = UIColor.white
        gameName.font = UIFont.systemFont(ofSize: 12)
        gameName.textColor = UIColor.colorWithHex("#c9c9cd")
        self?.contentView.addSubview(gameName)
        return gameName
    }()
}

extension Yo_HomeGameViewCell {
    fileprivate func setupUI() {
        coverImage.snp.remakeConstraints { (maker) in
            maker.centerX.equalTo(contentView.snp.centerX)
            maker.centerY.equalTo(contentView.snp.centerY).offset(-10)
            maker.width.height.equalTo(45)
        }
        gameName.snp.makeConstraints { (maker) in
            maker.top.equalTo(coverImage.snp.bottom).offset(7)
            maker.centerX.equalTo(coverImage.snp.centerX)
        }
    }
}

extension Yo_HomeGameViewCell {

    override func configure(Item: Any, indexPath: IndexPath) {
        let model = Item as? Yo_AnchorBaseGroup
        gameName.text = model?.tag_name
        
        if let iconUrl = URL(string: model?.icon_url ?? "") {
            coverImage.yo_setImage(iconUrl, placeholder: "", radius: 104)
        } else {
            coverImage.image = UIImage(named: "home_more_btn")
        }
        
    }
}
