//
//  LXImagePrivewLayout.swift
//  智慧运营
//
//  Created by 李旭 on 2018/9/12.
//  Copyright © 2018年 李旭. All rights reserved.
//

import UIKit

class LXImagePrivewLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        self.scrollDirection = .horizontal
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
