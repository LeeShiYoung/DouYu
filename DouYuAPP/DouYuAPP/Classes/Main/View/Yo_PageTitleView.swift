//
//  Yo_PageTitleView.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/5.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

private let titleW = kScreenW / 4
private let lineH = CGFloat(2)
private let layerH = CGFloat(0.5)
private let kNormalColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)

protocol PageTitleViewDelegate : class {
    func pageTitleView(_ titleView : Yo_PageTitleView, selectedIndex index : Int)
}

class Yo_PageTitleView: UIView {
    
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
    weak var delegate : PageTitleViewDelegate?
    
    fileprivate var currentIndex : Int = 0
    init(frame: CGRect, titles: [String]) {
        super.init(frame: frame)
        
        addSubview(lineView)
        
        configTitleView(titles: titles)
        layer.addSublayer(bottomLayer)
        
        
    }
    
    fileprivate lazy var lineView: UIView = {[weak self] in
        let lineView = UIView()
        lineView.backgroundColor = UIColor.orange
        lineView.frame = CGRect(x: 0, y: (self?.frame.size.height)! - lineH - layerH, width: kScreenW / 4, height: lineH)
        return lineView
        }()
    
    fileprivate lazy var bottomLayer: CAShapeLayer = {[weak self] in
        let bottomLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: (self?.frame.size.height)! - layerH * 0.5))
        path.addLine(to: CGPoint(x: (self?.frame.size.width)!, y: (self?.frame.size.height)! - layerH * 0.5))
        bottomLayer.path = path.cgPath
        bottomLayer.strokeColor = UIColor.colorWithHex("#9a9a9a")?.cgColor
        bottomLayer.lineWidth = layerH
        bottomLayer.frame = (self?.bounds)!
        return bottomLayer
        }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Yo_PageTitleView {
    
    fileprivate func configTitleView(titles: [String]) {
        for i in 0 ..< titles.count {
            let label = UILabel()
            label.textColor = UIColor.colorWithHex("#515151")
            label.text = titles[i]
            label.frame = CGRect(x: titleW * CGFloat(i), y: 0, width: titleW, height: self.frame.size.height - lineH)
            label.tag = i
            label.textAlignment = .center
            addSubview(label)
            titleLabels.append(label)
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(_:)))
            label.addGestureRecognizer(tapGes)
        }
    }
}

extension Yo_PageTitleView {
    func setTitleWithProgress(_ progress : CGFloat, sourceIndex : Int, targetIndex : Int) {
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
        
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        lineView.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        let colorDelta = (kSelectColor.0 - kNormalColor.0, kSelectColor.1 - kNormalColor.1, kSelectColor.2 - kNormalColor.2)
        
        sourceLabel.textColor = UIColor(r: kSelectColor.0 - colorDelta.0 * progress, g: kSelectColor.1 - colorDelta.1 * progress, b: kSelectColor.2 - colorDelta.2 * progress)
        
        targetLabel.textColor = UIColor(r: kNormalColor.0 + colorDelta.0 * progress, g: kNormalColor.1 + colorDelta.1 * progress, b: kNormalColor.2 + colorDelta.2 * progress)
        
        currentIndex = targetIndex
    }
}

extension Yo_PageTitleView {
    @objc fileprivate func titleLabelClick(_ tapGes : UITapGestureRecognizer) {
        
        // 0.获取当前Label
        guard let currentLabel = tapGes.view as? UILabel else { return }
        
        // 1.如果是重复点击同一个Title,那么直接返回
        if currentLabel.tag == currentIndex { return }
        
        // 2.获取之前的Label
        let oldLabel = titleLabels[currentIndex]
        
        // 3.切换文字的颜色
        currentLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        oldLabel.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        
        // 4.保存最新Label的下标值
        currentIndex = currentLabel.tag
        
        // 5.滚动条位置发生改变
        let scrollLineX = CGFloat(currentIndex) * lineView.frame.width
        UIView.animate(withDuration: 0.15, animations: {
            self.lineView.frame.origin.x = scrollLineX
        })
        
        // 6.通知代理
        delegate?.pageTitleView(self, selectedIndex: currentIndex)
    }
}
