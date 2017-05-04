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
    init(sourceView: UICollectionView)
    func registerCell(_ cells:() -> (listView: UICollectionView, cell: [String: UICollectionViewCell.Type]))
    func registerReusableView(Kind kind: String, views:() -> (listView: UICollectionView, view:[String: UIView.Type]))
    func set(DataSource data:() -> dataSoure, completion: () -> ())
    func dequeueCellID(_ indexPath: IndexPath) -> String
}


extension Yo_ListViewModelProtocol where Self: NSObject {
    
    func registerCell(_ cells:() -> (listView: UICollectionView, cell: [String: UICollectionViewCell.Type])) {
        for (key, value) in cells().cell {
            
            if cells().listView.isKind(of: UICollectionView.self) {
                cells().listView.register(value, forCellWithReuseIdentifier: key)
            }
        }
    }
    
    func registerReusableView(Kind kind: String, views:() -> (listView: UICollectionView, view:[String: UIView.Type])) {
        if views().listView.isKind(of: UICollectionView.self) {
            for (key, value) in views().view {
                views().listView.register(value, forSupplementaryViewOfKind: kind, withReuseIdentifier: key)
            }
        }
    }
}
