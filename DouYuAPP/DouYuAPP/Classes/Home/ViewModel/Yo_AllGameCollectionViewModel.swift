//
//  Yo_AllGameCollectionViewModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/5/2.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

public let AllGameViewCellID = "AllGameViewCellID"
public let AllGameHeaderView = "CommonGameHeaderView"

class Yo_AllGameCollectionViewModel: NSObject, Yo_ListViewModelProtocol {
    
    fileprivate var allGameView: UICollectionView?
    
    typealias dataSoure = [Yo_GameModel]
    
    lazy var dataSoureArr = dataSoure()
    
    required init(CollectionView collection: UICollectionView) {
        self.allGameView = collection
        super.init()
        allGameView?.dataSource = self
    }
    
    func set(DataSource data: () -> [Yo_GameModel], completion: () -> ()) {
        dataSoureArr.append(contentsOf: data())
        completion()
    }
    
    func dequeueCellID(_ indexPath: IndexPath) -> String {
        return AllGameViewCellID
    }
}

extension Yo_AllGameCollectionViewModel: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dequeueCellID(indexPath), for: indexPath) as! Yo_AllGameViewCell
        cell.configure(Item: dataSoureArr[indexPath.item], indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSoureArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AllGameHeaderView, for: indexPath) as!  Yo_BaseSectionHeaderView
        headerView.headerIcon.image = UIImage(named: "Img_orange")
        headerView.sectionName.text = "全部"
        return headerView
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

