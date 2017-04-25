//
//  Yo_RecommendContentView.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/1.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import FSPagerView

class Yo_RecommendContentView: Yo_BaseContentView {
    
    override func configureView() {
        super.configureView()
    }
    
    lazy var collectionView: UICollectionView = {[weak self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: 50)
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.contentInset = UIEdgeInsets(top:kCycleViewH + kGameViewH, left: 0, bottom: 0, right: 0)
        return collectionView
        }()
    
    lazy var cycleView: Yo_HomeCycleView = {[weak self] in
        let cycleView = Yo_HomeCycleView(frame: CGRect.zero)
        cycleView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: cycleViewCellID)
        cycleView.itemSize = .zero
        cycleView.automaticSlidingInterval = 3.0
        self?.collectionView.addSubview(cycleView)
        return cycleView
    }()
    
    lazy var gameView: UICollectionView = {[weak self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 80, height: kGameViewH)
        layout.scrollDirection = .horizontal
        
        let gameView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        gameView.backgroundColor = UIColor.white
        gameView.showsHorizontalScrollIndicator = false
        gameView.showsVerticalScrollIndicator = false
        self?.collectionView.addSubview(gameView)
        return gameView
        }()
   
}

private let kCycleViewH = kScreenW * 3 / 8
private let kGameViewH : CGFloat = 90

extension Yo_RecommendContentView {
    public func setupUI() {
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (maker) in
            maker.top.bottom.left.right.equalTo(self)
        }
        
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH + kGameViewH), width: kScreenW, height: kCycleViewH)
        
        addIndicatorView()
    }
}
