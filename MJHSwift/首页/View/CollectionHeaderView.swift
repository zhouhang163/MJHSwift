//
//  CollectionHeaderView.swift
//  MJHSwift
//
//  Created by ZhouHang on 2018/1/16.
//  Copyright © 2018年 ZhouHang. All rights reserved.
//

import UIKit

let headerIdentifier = "header"

class CollectionHeaderView: UICollectionReusableView {
    
    var zzczBtn = UIButton(type:.custom)
    var shBtn = UIButton(type:.custom)
    var nfcBtn = UIButton(type:.custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        draw(frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        zzczBtn.frame = CGRect(x:0, y:0, width:SCREEN_WIDTH/3, height:100)
        zzczBtn.setImage(UIImage(named:"cz"), for: .normal)
        zzczBtn.setTitle("自助充值", for: .normal)
        self.addSubview(zzczBtn)

    }
    

}
