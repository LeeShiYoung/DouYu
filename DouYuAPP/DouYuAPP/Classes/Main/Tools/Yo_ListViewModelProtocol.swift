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
    func registerCell(_ cells:() -> [String: UICollectionViewCell.Type])
    func registerReusableView(Kind kind: String, views:() -> [String: UIView.Type])
    func set(DataSource data:() -> dataSoure, completion: () -> ())
    func dequeueCellID(_ indexPath: IndexPath) -> String
    
}
