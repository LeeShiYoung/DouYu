//
//  Yo_BaseCollectionViewCell.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/30.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class Yo_BaseCollectionViewCell: GenericCollectionViewCell {
    
    override func configureView() {
        super.configureView()
        coverImage.snp.makeConstraints { (maker) in
            maker.left.right.top.bottom.equalTo(contentView)
        }
        
        
    }
    
    public lazy var coverImage: UIImageView = {[weak self] in
        let coverImage = UIImageView()
        self?.contentView.addSubview(coverImage)
        return coverImage
        }()
}

extension Yo_BaseCollectionViewCell: Yo_BaseCollectionViewProtocol {
    public func configure(Item: Any, indexPath: IndexPath) {
        
    }
}
