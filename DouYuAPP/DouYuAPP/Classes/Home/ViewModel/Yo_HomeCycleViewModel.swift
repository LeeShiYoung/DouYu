//
//  Yo_HomeCycleViewModel.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/1.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit
import FSPagerView
import Kingfisher

public let cycleViewCellID = "CycleViewcell"
class Yo_HomeCycleViewModel: NSObject {
    
    var cycleView: Yo_HomeCycleView?
    
    var dataSoureArray: [Yo_HomeCycleModel]? 
    
    init(CycleView cycleView: Yo_HomeCycleView) {
        self.cycleView = cycleView
        super.init()
        cycleView.dataSource = self
        cycleView.delegate = self
        cycleView.isInfinite = true
    }
    
    public func setCycleDataSoure(_ datas: () -> [Yo_HomeCycleModel]?, completion:() -> ()) {
        dataSoureArray = datas()
        cycleView?.pageControl.numberOfPages = datas()?.count ?? 0
        completion()
    }
}

extension Yo_HomeCycleViewModel: FSPagerViewDataSource, FSPagerViewDelegate{
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return dataSoureArray?.count ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: cycleViewCellID, at: index)
        cell.imageView?.yo_setImage(URL(string: (dataSoureArray?[index].pic_url)!), placeholder: "Img_default", radius: 0)
        cell.textLabel?.text = dataSoureArray?[index].title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.textLabel?.superview?.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        cycleView?.pageControl.currentPage = index
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard cycleView?.pageControl.currentPage != pagerView.currentIndex else {
            return
        }
        cycleView?.pageControl.currentPage = pagerView.currentIndex
    }
}
