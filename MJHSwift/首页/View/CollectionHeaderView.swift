//
//  CollectionHeaderView.swift
//  MJHSwift
//
//  Created by ZhouHang on 2018/1/16.
//  Copyright © 2018年 ZhouHang. All rights reserved.
//

import UIKit

let headerIdentifier = "header"

////继承于class是因为只有继承于class才能用weak来修饰代理
//protocol collectionHeaderViewDelegate: class {
//    //代理方法，必须要实现这个方法
//    //如果要让方法为可选，不必一定实现这个方法，可以在`protocol`之前加    @objc，并且在方法前加optional，那么这个代理方法就会变成可选，实现与否都不会影响
//    func showInfo() -> Void
//}

class CollectionHeaderView: UICollectionReusableView {
    
    var zzczBtn = UIButton(type:.custom)
    var shBtn = UIButton(type:.custom)
    var nfcBtn = UIButton(type:.custom)
//    //用weak修饰代理是为了防止相互引用造成内存泄漏
//    weak var delegate: collectionHeaderViewDelegate!
    
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
        zzczBtn.set(image: UIImage(named: "cz"), title: "自助充值", titlePosition: .bottom,
                 additionalSpacing: 10.0, state: .normal)
//        zzczBtn.addTarget(self, action: #selector(self.show), for: .touchUpInside)
        self.addSubview(zzczBtn)
        
    }
//    @objc func show() {
//        delegate.showInfo()
//    }

}
