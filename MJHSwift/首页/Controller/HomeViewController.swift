//
//  HomeViewController.swift
//  MJHSwift
//
//  Created by ZhouHang on 2018/1/15.
//  Copyright © 2018年 ZhouHang. All rights reserved.
//

import UIKit

//UICollectionViewDelegate是父协议UICollectionViewDelegateFlowLayout是子协议
//遵循了子协议就不用遵循父协议了
class HomeViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //定义重用标志
    let itemIdentifier = "item"
    //区头 区尾
    let headerIdentifier = "header"
    //注册重用标志
    let footerIdentifier = "footer"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.withHex(hexString: MJHBackColor)
        //扫一扫按钮
        let btn = UIButton(type:.custom)
        btn.frame = CGRect(x:0, y:0, width:40, height:40)
        btn.setImage(UIImage(named:"saoma"), for: UIControlState.normal)
        btn.addTarget(self, action: #selector(saomaClicked), for: UIControlEvents.touchUpInside)
        let item = UIBarButtonItem(customView:btn)
        self.navigationItem.rightBarButtonItem = item
        
        
        //创建布局对象
        let flowLayout = UICollectionViewFlowLayout()
        //设置item的大小
        flowLayout.itemSize = CGSize(width:100, height:100)
        //设置滚动的方向 horizontal为水平滚动
        flowLayout.scrollDirection = .vertical
        //设置最小行间距
        flowLayout.minimumLineSpacing = 1
        //设置最小列间距
        flowLayout.minimumInteritemSpacing = 40
        //设置分区缩进量
        flowLayout.sectionInset = UIEdgeInsets(top:10, left:10, bottom:10, right:10)
        //设置区头大小
        flowLayout.headerReferenceSize = CGSize(width:SCREEN_WIDTH, height:120);
        flowLayout.footerReferenceSize = CGSize(width:SCREEN_WIDTH, height:200);
        //创建一个UIcollectionView的布局
        //UIcollectionView的布局比较复杂，所以专门为它设计了一个布局类UIcollectionView，但是很少使用它的基类，都是使用它的子类UICollectionViewFlowLayout
        let collectionView = UICollectionView(frame:UIScreen.main.bounds, collectionViewLayout:flowLayout)
        collectionView.backgroundColor = UIColor.withHex(hexString: MJHBackColor)
        //注册item
        //collectionview就是一个视图，什么控件都没有，需要自定义cell来展示文字或者图片
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: itemIdentifier)
        //注册区头
        collectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        //注册区尾
        collectionView.register(CollectionFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier)
        //指定数据源代理
        collectionView.dataSource = self
        //指定业务代理
        collectionView.delegate = self
        
        let view = UIView(frame:CGRect(x:0,y:-SCREEN_HEIGHT+10,width:SCREEN_WIDTH,height:SCREEN_HEIGHT))
        view.backgroundColor = UIColor.withHex(hexString: MJHColor)
        collectionView.addSubview(view)
        //添加视图
        self.view.addSubview(collectionView)
        
        
        // Do any additional setup after loading the view.
    }
    //MARK:_UICollectionViewDataSource协议方法
    fileprivate func extractedFunc(_ kind: String, _ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionReusableView {
        var reusableHeaderview:CollectionHeaderView!
        var reusableFooterview:CollectionFooterView!
        if kind == UICollectionElementKindSectionHeader {
            reusableHeaderview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! CollectionHeaderView
            reusableHeaderview.backgroundColor = UIColor.withHex(hexString: MJHColor)
            return reusableHeaderview
        }
        if kind == UICollectionElementKindSectionFooter {
            reusableFooterview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerIdentifier, for: indexPath) as! CollectionFooterView
            reusableFooterview.backgroundColor = UIColor.brown
            return reusableFooterview
        }
        return reusableHeaderview
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        return extractedFunc(kind, collectionView, indexPath)
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width:250, height:50)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width:250, height:50)
//    }
    
    //返回CollectionView有多少分区
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //返回一个分区有多少个Item的方法
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemIdentifier, for: indexPath)
        
        cell.backgroundColor = UIColor.red
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("点我"+String(indexPath.row))
    }
    
    //MARK:扫码按钮点击
    @objc func saomaClicked() -> Void {
        print("扫码")
    }
    
    func showInfo() {
        print("showInfo😄")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
