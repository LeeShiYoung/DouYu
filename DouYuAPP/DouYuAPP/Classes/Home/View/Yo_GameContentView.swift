//
//  Yo_GameContentView.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/28.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

private let kGameViewH : CGFloat = 90
private let kHeaderViewH : CGFloat = 50
private let kEdgeMargin : CGFloat = 10
private let kItemW : CGFloat = (kScreenW - 2 * kEdgeMargin) / 3
private let kItemH : CGFloat = kItemW * 6 / 5


class Yo_GameContentView: Yo_BaseContentView {

    override func configureView() {
        super.configureView()
        
    }
    
    lazy var allGameView: UICollectionView = {[weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        
        let allGameView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        allGameView.showsHorizontalScrollIndicator = false
        allGameView.showsVerticalScrollIndicator = false
        allGameView.contentInset = UIEdgeInsets(top: kGameViewH + kHeaderViewH, left: 0, bottom: 0, right: 0)
        allGameView.addSubview((self?.commonGameView)!)
        self?.addSubview(allGameView)
        
        let headerView = Yo_BaseSectionHeaderView()
        headerView.headerIcon.image = UIImage(named: "Img_orange")
        headerView.sectionName.text = "常用"
        headerView.frame = CGRect(x: 0, y: -(kGameViewH + kHeaderViewH), width: kScreenW, height: kHeaderViewH)
        allGameView.addSubview(headerView)
        allGameView.backgroundColor = UIColor.white
        return allGameView
    }()
    
    lazy var commonGameView: UICollectionView = {[weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 80, height: kGameViewH)
        layout.scrollDirection = .horizontal
        
        let commonCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        commonCollectionView.showsHorizontalScrollIndicator = false
        commonCollectionView.showsVerticalScrollIndicator = false
        commonCollectionView.frame = CGRect(x: 0, y: -(kGameViewH + kHeaderViewH), width: kScreenW, height: kGameViewH + kHeaderViewH)
        commonCollectionView.contentInset = UIEdgeInsets(top: kHeaderViewH, left: 0, bottom: 0, right: 0)
        commonCollectionView.backgroundColor = UIColor.white
        return commonCollectionView
    }()
}

extension Yo_GameContentView {
    
    ///   布局
    public func setupUI() {
        allGameView.snp.makeConstraints { (maker) in
            maker.top.bottom.left.right.equalTo(self)
        }
        
        
        addIndicatorView()
    }
    
    
}
