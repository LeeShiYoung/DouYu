//
//  Yo_RecommendPrettyCell.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/31.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

class Yo_RecommendPrettyCell: Yo_BaseCollectionViewCell {

    override func configureView() {
        super.configureView()
        setupUI()
    }
    
    fileprivate lazy var locIcon: UIImageView = {[weak self] in
        let locIcon = UIImageView(image: UIImage(named: "ico_location"))
        self?.contentView.addSubview(locIcon)
        return locIcon
    }()
    
    fileprivate lazy var anchorLoc: UILabel = {[weak self] in
        let anchorLoc = UILabel()
        anchorLoc.textColor = UIColor.colorWithHex("#a2a4a8")
        anchorLoc.font = UIFont.systemFont(ofSize: 11)
        self?.contentView.addSubview(anchorLoc)
        return anchorLoc
    }()

    fileprivate lazy var anchorName: UILabel = {[weak self] in
        let anchorName = UILabel()
        anchorName.textColor = UIColor.colorWithHex("#000000")
        anchorName.font = UIFont.systemFont(ofSize: 12)
        self?.contentView.addSubview(anchorName)
        return anchorName
    }()
    
    fileprivate lazy var onLineLabel: UILabel = {[weak self] in
        let onLineLabel = UILabel()
        onLineLabel.textColor = UIColor.white
        onLineLabel.font = UIFont.systemFont(ofSize: 12)
        onLineLabel.layer.cornerRadius = 3
        onLineLabel.clipsToBounds = true
        onLineLabel.backgroundColor = UIColor.colorWithHex("#000000", alpha: 0.5)
        onLineLabel.textAlignment = .center
        self?.coverImage.addSubview(onLineLabel)
        return onLineLabel
    }()
}

extension Yo_RecommendPrettyCell {
    fileprivate func setupUI() {
        coverImage.snp.updateConstraints { (maker) in
            maker.bottom.equalTo(contentView.snp.bottom).offset(-52)
        }
        locIcon.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(contentView.snp.bottom).offset(-11)
            maker.left.equalTo(contentView.snp.left)
        }
        
        anchorLoc.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(locIcon.snp.centerY)
            maker.left.equalTo(locIcon.snp.right).offset(5)
        }
        
        anchorName.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(locIcon.snp.top).offset(-10)
            maker.left.equalTo(locIcon.snp.left)
            maker.height.equalTo(12)
        }
        
        onLineLabel.snp.makeConstraints { (maker) in
            maker.right.equalTo(coverImage.snp.right).offset(-8)
            maker.top.equalTo(coverImage.snp.top).offset(4)
            maker.height.equalTo(21)
            maker.width.equalTo(60)
        }
    }
}

extension Yo_RecommendPrettyCell {

    override func configure(Item: Any, indexPath: IndexPath) {
        super.configure(Item: Item, indexPath: indexPath)
        let model = Item as! Yo_AnchorModel
        coverImage.yo_setImage(URL(string: model.vertical_src), placeholder: "", radius: 20)
        anchorLoc.text = model.anchor_city
        anchorName.text = model.nickname
        onLineLabel.text = model.onlineFormat
    }
}
