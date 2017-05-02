
//
//  Yo_CommonGameViewCell.swift
//  DouYuAPP
//
//  Created by shying li on 2017/5/2.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

class Yo_CommonGameViewCell: Yo_HomeGameViewCell {
   
    override func configure(Item: Any, indexPath: IndexPath) {
        let model = Item as? Yo_GameModel
        gameName.text = model?.tag_name
        
        if let iconUrl = URL(string: model?.icon_url ?? "") {
            coverImage.yo_setImage(iconUrl, placeholder: "", radius: 104)
        }
    }

}
