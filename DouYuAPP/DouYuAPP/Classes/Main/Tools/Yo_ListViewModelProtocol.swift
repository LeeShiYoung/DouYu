//
//  Yo_ListViewModelProtocol.swift
//  DouYuAPP
//
//  Created by shying li on 2017/5/2.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import Foundation
import UIKit

protocol Yo_ListViewModelProtocol {
    
    associatedtype dataSoure
    var dataSoureArr: dataSoure { get set }
    init(CollectionView collection: UICollectionView)
    func registerCell(_ cells:() -> (listView: UIScrollView, cell: [String: UICollectionViewCell.Type]))
    func registerReusableView(Kind kind: String, views:() -> (listView: UIScrollView, view:[String: UIView.Type])) 
    func set(DataSource data:() -> dataSoure, completion: () -> ())
    func dequeueCellID(_ indexPath: IndexPath) -> String
}


extension Yo_ListViewModelProtocol where Self: NSObject {
    func registerCell(_ cells:() -> (listView: UIScrollView, cell: [String: UICollectionViewCell.Type])) {
        for (key, value) in cells().cell {
            
            if cells().listView.isKind(of: UICollectionView.self) {
                (cells().listView as! UICollectionView).register(value, forCellWithReuseIdentifier: key)
            }
        }
    }
    
    func registerReusableView(Kind kind: String, views:() -> (listView: UIScrollView, view:[String: UIView.Type])) {
        if views().listView.isKind(of: UICollectionView.self) {
            for (key, value) in views().view {
                (views().listView as! UICollectionView).register(value, forSupplementaryViewOfKind: kind, withReuseIdentifier: key)
            }
        }
    }
}
