//
//  Yo_RecommendCollectionViewModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/30.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

public let normalCellID = "normalCellID"
public let prettyCellID = "prettyCellID"
public let sectionHeaderID = "sectionHeaderID"


protocol Yo_RecommendCollectionViewModelDeleagte: NSObjectProtocol {
    func presentShowRoom()
    func pushNormalRoom()
}
class Yo_RecommendCollectionViewModel: Yo_BaseCollectionViewModel {
    
    weak var delegate: Yo_RecommendCollectionViewModelDeleagte?
    override init(CollectionView collection: UICollectionView) {
        super.init(CollectionView: collection)
        collection.delegate = self
    }

    override func dequeueCellID(_ indexPath: IndexPath) -> String {
        if indexPath.section == 1 {
            return prettyCellID
        }
        return normalCellID
    }
    
    
}

extension Yo_RecommendCollectionViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (kScreenW - 3 * 10) / 2
        if indexPath.section == 1 {
             return CGSize(width: width, height: width * 1.33 + 50)
        }
        
        return CGSize(width: width, height: width / 1.7 + 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: sectionHeaderID, for: indexPath) as! Yo_HomeSectionHeaderView
        reusableView.configure(Item: dataSoureArr[indexPath.section], indexPath: indexPath)
        return reusableView
    }
}

extension Yo_RecommendCollectionViewModel: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let anchorModel = dataSoureArr[indexPath.section].room_list?[indexPath.item]
        
        anchorModel?.isVertical == 0 ? pushNormalRoom() : presentShowRoom()
    }
    
    fileprivate func presentShowRoom() {
        delegate?.presentShowRoom()
    }
    
    fileprivate func pushNormalRoom() {
        delegate?.pushNormalRoom()
    }
}

