//
//  Yo_MainExtension.swift
//  DouYuAPP
//
//  Created by shying li on 2017/4/5.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import Foundation
import Kingfisher
import RxSwift
import RxCocoa

extension UITableViewCell {
    class func register(TableView table: UITableView, identifier: String) {
        
        table.register(self, forCellReuseIdentifier: identifier)
    }
}

extension UIBarButtonItem {
    class func item(imageName name: String, disposable: DisposeBag, subscribe: @escaping () -> ()) -> UIBarButtonItem {
        
        let itemButton = UIButton(type: UIButtonType.custom)
        itemButton.setImage(UIImage(named: name), for: UIControlState.normal)
        itemButton.setImage(UIImage(named: name + "_click"), for: UIControlState.highlighted)
        itemButton.sizeToFit()
        itemButton.bindFunction(disposable: disposable, subscribe: subscribe)
        return UIBarButtonItem(customView: itemButton)
    }
}

extension UITableViewCell {
    func configure(Item: Any, indexPath: IndexPath) {
        
    }
}

extension Date {
    static func getCurrentTime() -> String {
        let nowDate = Date()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}

extension UIImageView {
    func yo_setImage(_ url: URL?, placeholder: String, radius: CGFloat) {
        
        let p = RoundCornerImageProcessor(cornerRadius: radius)
        self.kf.setImage(with: url, placeholder: UIImage(named: placeholder) , options: [.processor(p)], progressBlock: nil, completionHandler: nil)
        
        // KingfisherOptionsInfoItem
        //        KingfisherManager.shared.downloader.downloadImage(with: url!, options: [.processor(p)], progressBlock: nil) { (image, error, _, _) in
        //            if let image = image {
        //                self.image = image
        //
        //                DispatchQueue.global().async {
        //                    print("--- \(Thread.current)")
        //                    let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: self.frame.size)
        //                    UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        //                    UIGraphicsGetCurrentContext()?.addPath(UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: radius, height: radius)).cgPath)
        //                    UIGraphicsGetCurrentContext()?.clip()
        //                    image.draw(in: rect)
        //                    UIGraphicsGetCurrentContext()?.drawPath(using: .fillStroke)
        //                    let output = UIGraphicsGetImageFromCurrentImageContext()
        //                    UIGraphicsEndImageContext()
        //                    DispatchQueue.main.async {
        //                        self.image = output
        //                        print(Thread.current)
        //                    }
        //                }
        //            }
        //        }
    }
}

extension UIColor {
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}


