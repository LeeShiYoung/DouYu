//
//  Yo_HomeContentView.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/15.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


protocol Yo_HomeContentViewDelegate: NSObjectProtocol {

    func barButtonItemlogoTap(_ item: UIBarButtonItem?)
    func barButtonItemSearchTap(_ item: UIBarButtonItem?)
    func barButtonItemScanTap(_ item: UIBarButtonItem?)
    func barButtonItemHistoryTap(_ item: UIBarButtonItem?)
}

class Yo_HomeContentView: Yo_BaseContentView {
    
    weak var delegate: Yo_HomeContentViewDelegate?
    
    public var viewController: UIViewController?
    public var pageContentView: Yo_PageContentView!
    
    override func configureView() {
        super.configureView()

    }
  
    public lazy var pageTitleView: Yo_PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let pageTitleView = Yo_PageTitleView(frame: titleFrame, titles: titles)
        return pageTitleView
    }()
}

extension Yo_HomeContentView {
    
    public func setupUI(partentVC: Yo_HomeViewController?) {
        addSubview(pageTitleView)
        pageTitleView.delegate = partentVC
        configureNavigation(viewController: partentVC!)
        configPageContentView(partentVC: partentVC)
    }
    
    fileprivate func configPageContentView(partentVC: Yo_HomeViewController?) {
        let childVcs = [Yo_RecommendViewController(), Yo_GameViewController(), Yo_AmuseViewController(), Yo_FunnyViewController()]
                let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabbarH
        let pageContentView = Yo_PageContentView(frame: CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH), chidrenViewControllers: childVcs, parentViewController: partentVC)
        pageContentView.delegate = partentVC!
        self.pageContentView = pageContentView
        addSubview(pageContentView)
    }
    
     // MARK: - 设置导航栏
    fileprivate func configureNavigation(viewController vc: Yo_HomeViewController) {
        let logoItem = UIBarButtonItem.item(imageName: "logo", disposable: disposeBag, subscribe: {[weak self] in
            self?.delegate?.barButtonItemlogoTap(nil)
        })
        
        let searchItem = UIBarButtonItem.item(imageName: "btn_search", disposable: disposeBag, subscribe: {
            self.delegate?.barButtonItemSearchTap(nil)
        })
        let scanItem = UIBarButtonItem.item(imageName: "Image_scan", disposable: disposeBag, subscribe: {
            self.delegate?.barButtonItemScanTap(nil)
        })
        let historyItem = UIBarButtonItem.item(imageName: "image_my_history", disposable: disposeBag, subscribe: {
            self.delegate?.barButtonItemHistoryTap(nil)
        })
        vc.navigationItem.leftBarButtonItem = logoItem
        vc.navigationItem.rightBarButtonItems = [historyItem, scanItem, searchItem]
    }
    
    public func setDelegate(ViewModel vm: Yo_HomeViewModel) {
        delegate = vm
    }
}

