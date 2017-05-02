//
//  Yo_CommonGameCollectionViewModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/5/2.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

public let CommonGameViewCell = "CommonGameViewCell"

class Yo_CommonGameCollectionViewModel: NSObject, Yo_ListViewModelProtocol {
    
    fileprivate var commonGameView: UICollectionView?
    
    typealias dataSoure = [Yo_GameModel]
    
    lazy var dataSoureArr = dataSoure()
    
    required init(CollectionView collection: UICollectionView) {
        self.commonGameView = collection
        super.init()
        commonGameView?.dataSource = self
    }
    
    func set(DataSource data: () -> [Yo_GameModel], completion: () -> ()) {
        dataSoureArr.append(contentsOf: data())
        completion()
    }
    
    func dequeueCellID(_ indexPath: IndexPath) -> String {
        return CommonGameViewCell
    }
}

extension Yo_CommonGameCollectionViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonGameViewCell, for: indexPath) as! Yo_CommonGameViewCell
        cell.configure(Item: dataSoureArr[indexPath.item], indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSoureArr.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

