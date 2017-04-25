
//
//  Yo_BaseCollectionViewModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/28.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

private let kItemMargin : CGFloat = 10
private let kHeaderViewH : CGFloat = 50


private let kHeaderViewID = "kHeaderViewID"
let kPrettyCellID = "kPrettyCellID"

let kNormalItemW = (kScreenW - 3 * kItemMargin) / 2
let kNormalItemH = kNormalItemW * 3 / 4
let kPrettyItemH = kNormalItemW * 4 / 3

class Yo_BaseCollectionViewModel: NSObject {

    fileprivate var collectionView: UICollectionView?
    
    init(CollectionView collection: UICollectionView) {
        self.collectionView = collection
        super.init()
        
        self.collectionView?.dataSource = self
        
    }
    
    
    public func registerCell(_ cells:() -> [String: UICollectionViewCell.Type]) {
        for (key, value) in cells() {
            collectionView?.register(value, forCellWithReuseIdentifier: key)
        }
    }
    
    public func registerReusableView(Kind kind: String, views:() -> [String: UIView.Type]) {
        for (key, value) in views() {
            collectionView?.register(value, forSupplementaryViewOfKind: kind, withReuseIdentifier: key)
        }
    }
    
    public func set(DataSource data:() -> [Yo_AnchorBaseGroup], completion: () -> ()) {
        dataSoureArr.append(contentsOf: data())
        completion()
    }
    
    public func dequeueCellID(_ indexPath: IndexPath) -> String {
        return ""
    }
    
    public lazy var dataSoureArr: [Yo_AnchorBaseGroup] = {
        let arr = [Yo_AnchorBaseGroup]()
        return arr
    }()
    
    
}

extension Yo_BaseCollectionViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dequeueCellID(indexPath), for: indexPath) as! Yo_BaseCollectionViewCell
        cell.configure(Item: dataSoureArr[indexPath.section].room_list![indexPath.item], indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSoureArr[section].room_list?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSoureArr.count
    }
}

