//
//  Yo_HomeViewModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/15.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

protocol Yo_HomeViewModelDelegate: NSObjectProtocol {
    func barButtonItemlogoTap(_ item: UIBarButtonItem?)
    func barButtonItemSearchTap(_ item: UIBarButtonItem?)
    func barButtonItemScanTap(_ item: UIBarButtonItem?)
    func barButtonItemHistoryTap(_ item: UIBarButtonItem?)
}
class Yo_HomeViewModel: NSObject {
    weak var delegate: Yo_HomeViewModelDelegate?

}

extension Yo_HomeViewModel: Yo_HomeContentViewDelegate {
    func barButtonItemlogoTap(_ item: UIBarButtonItem?) {
        delegate?.barButtonItemlogoTap(item)
    }
    
    func barButtonItemSearchTap(_ item: UIBarButtonItem?) {
        delegate?.barButtonItemSearchTap(item)
    }
    
    func barButtonItemScanTap(_ item: UIBarButtonItem?) {
        delegate?.barButtonItemScanTap(item)
    }
    
    func barButtonItemHistoryTap(_ item: UIBarButtonItem?) {
        delegate?.barButtonItemHistoryTap(item)
    }
}
