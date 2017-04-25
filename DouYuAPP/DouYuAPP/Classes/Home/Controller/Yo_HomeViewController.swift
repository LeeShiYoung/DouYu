//
//  Yo_HomeViewController.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/14.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

class Yo_HomeViewController: GenericViewController<Yo_HomeContentView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.setupUI(partentVC: self)
        
        contentView.setDelegate(ViewModel: homeViewModel)
    }
    
    private lazy var homeViewModel: Yo_HomeViewModel = {[weak self] in
        let viewModel = Yo_HomeViewModel()
        viewModel.delegate = self
        return viewModel
        }()
    
}

extension Yo_HomeViewController: Yo_HomeViewModelDelegate {
    func barButtonItemlogoTap(_ item: UIBarButtonItem?) {
        
    }
    
    func barButtonItemSearchTap(_ item: UIBarButtonItem?) {
        
    }
    
    func barButtonItemScanTap(_ item: UIBarButtonItem?) {
        
    }
    
    func barButtonItemHistoryTap(_ item: UIBarButtonItem?) {
        
    }
}

extension Yo_HomeViewController : PageTitleViewDelegate {
    func pageTitleView(_ titleView: Yo_PageTitleView, selectedIndex index: Int) {
        self.contentView.pageContentView.setCurrentIndex(index)
    }
}

extension Yo_HomeViewController: PageContentViewDelegate {
    func pageContentView(_ contentView: Yo_PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        self.contentView.pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}

