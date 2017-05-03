//
//  Yo_GameViewController.swift
//  DouYuAPP
//
//  Created by shying li on 2017/3/28.
//  Copyright © 2017年 李世洋. All rights reserved.
//

import UIKit

class Yo_GameViewController: GenericViewController<Yo_GameContentView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.setupUI()
        
        loadGameData()
        
        commonGameViewModel.registerCell {[weak self] () -> (listView: UICollectionView, cell: [String : UICollectionViewCell.Type]) in
            return ((self?.contentView.commonGameView)!, [CommonGameViewCell: Yo_CommonGameViewCell.self])
        }
        
        allGameViewModel.registerReusableView(Kind: UICollectionElementKindSectionHeader) {[weak self] () -> (listView: UICollectionView, view: [String : UIView.Type]) in
            return ((self?.contentView.allGameView)!, [AllGameHeaderView: Yo_BaseSectionHeaderView.self])
        }
        
        allGameViewModel.registerCell {[weak self] () -> (listView: UICollectionView, cell: [String : UICollectionViewCell.Type]) in
            return ((self?.contentView.allGameView)!, [AllGameViewCellID: Yo_AllGameViewCell.self])
        }
        
    }
    
    fileprivate lazy var gameViewModel = Yo_GameViewModel()
    
    fileprivate lazy var commonGameViewModel: Yo_CommonGameCollectionViewModel = {[weak self] in
        let commonGameViewModel = Yo_CommonGameCollectionViewModel(sourceView: (self?.contentView.commonGameView)!)
        return commonGameViewModel
        }()
    
    fileprivate lazy var allGameViewModel: Yo_AllGameCollectionViewModel = {[weak self] in
        let allGameViewModel = Yo_AllGameCollectionViewModel(sourceView: (self?.contentView.allGameView)!)
        return allGameViewModel
        }()
}

extension Yo_GameViewController {
    
    fileprivate func loadGameData() {
        gameViewModel.loadGameData { (commonGame, allGame) in
            
            self.commonGameViewModel.set(DataSource: { () -> [Yo_GameModel] in
                return commonGame
            }, completion: {
                self.contentView.commonGameView.reloadData()
            })
            
            self.allGameViewModel.set(DataSource: { () -> [Yo_GameModel] in
                return allGame
            }, completion: { 
                self.contentView.allGameView.reloadData()
            })
        }
    }
}
