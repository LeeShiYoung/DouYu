//
//  Yo_RecommendGameCollectionViewModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/5/2.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

public let HomeGameViewCell = "HomeGameViewCell"

class Yo_RecommendGameCollectionViewModel: Yo_BaseCollectionViewModel {
    override func dequeueCellID(_ indexPath: IndexPath) -> String {
        return  HomeGameViewCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dequeueCellID(indexPath), for: indexPath) as! Yo_HomeGameViewCell
        cell.configure(Item: dataSoureArr[indexPath.item], indexPath: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSoureArr.count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
