//
//  TabBarViewController.swift
//  MJHSwift
//
//  Created by ZhouHang on 2018/1/15.
//  Copyright © 2018年 ZhouHang. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var _backView:UIView? = nil
    var items:NSArray = []
    let nameArr = ["首页", "我的", "更多"]
    let picArr = ["tab_sy", "tab_wode", "tab_gengd"]
    let picselArr = ["tab_sy_sel", "tab_wode_sel", "tab_gengd_sel"]
    let viewControllerArr = [HomeViewController(), MineViewController(), MoreViewController()]

    //初始化数组
    var NavVCArr:[NSObject] = [NSObject]()
    var nav:UINavigationController = UINavigationController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.creatTabBar()
        // Do any additional setup after loading the view.
    }
    let modelName = UIDevice.current.modelName
    //创建tabbar
    func creatTabBar() -> Void {
        if(modelName == "iPhone X") {
            _backView = UIView(frame:CGRect(x:0,y:0,width:SCREEN_WIDTH,height:80))
        } else {
            _backView = UIView(frame:CGRect(x:0,y:0,width:SCREEN_WIDTH,height:49))
        }
        //首页
        let homeVC = HomeViewController()
        homeVC.title = "美伽汇"
        let homeNav = UINavigationController(rootViewController:homeVC)
        homeNav.tabBarItem.title = "首页"
        homeNav.tabBarItem.image = UIImage(named:"tab_sy")
        var sy_selectedimage:UIImage = UIImage(named: "tab_sy_sel")!
        sy_selectedimage = sy_selectedimage.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        homeNav.tabBarItem.selectedImage = sy_selectedimage
        
        //我的
        let mineVC = MineViewController()
        mineVC.title = "我的"
        let mineNav = UINavigationController(rootViewController:mineVC)
        mineNav.tabBarItem.title = "我的"
        mineNav.tabBarItem.image = UIImage(named:"tab_wode")
        var wode_selectedimage:UIImage = UIImage(named: "tab_wode_sel")!
        wode_selectedimage = wode_selectedimage.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        mineNav.tabBarItem.selectedImage = wode_selectedimage
        
        //更多
        let moreVC = MoreViewController()
        moreVC.title = "更多"
        let moreNav = UINavigationController(rootViewController:moreVC)
        moreNav.tabBarItem.title = "更多"
        moreNav.tabBarItem.image = UIImage(named:"tab_gengd")
        var gengd_selectedimage:UIImage = UIImage(named: "tab_gengd_sel")!
        gengd_selectedimage = gengd_selectedimage.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        moreNav.tabBarItem.selectedImage = gengd_selectedimage
        
        //添加工具栏
        items = [homeNav,mineNav,moreNav]
        self.viewControllers = items as? [UIViewController]
        for i in 0 ..< items.count {
            /*
             (items[i] as AnyObject) 相当于 self.navigationController?
             **/
            (items[0] as AnyObject).navigationBar.shadowImage = UIImage()
            (items[i] as AnyObject).navigationBar.isTranslucent = false
            //设置导航栏的背景图片(优先级高)
            (items[i] as AnyObject).navigationBar.setBackgroundImage(UIImage(named:"NavigationBar"), for:.default)
            //设置导航栏的背景颜色(优先级低)
            (items[i] as AnyObject).navigationBar.barTintColor = UIColor.withHex(hexString: MJHColor)
            //设置导航栏的字体颜色
            (items[i] as AnyObject).navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
            
            /**
             for循环控制器数组 写法
             
             for  M in 0 ..< VCArr.count {
             nav = UINavigationController(rootViewController:(VCArr[M] as AnyObject as! UIViewController))
             
             nav.tabBarItem.title = NameArr[M]
             nav.tabBarItem.image = UIImage(named:PicArr[M])
             nav.tabBarItem.selectedImage = UIImage(named:PicSelectArr[M])
             VCArr[M].title = NameArr[M]
             NavVCArr.append(nav)
             }
             // 添加工具栏
             // items = [MainNav,ClassNav,CartNav,MyNav]
             self.viewControllers = NavVCArr as? [UIViewController]
             for  i in 0 ..< NavVCArr.count {
             /*
             (items[i] as AnyObject) 相当于 self.navigationController?
             **/
             //设置导航栏的背景图片 （优先级高）
             (NavVCArr[i] as AnyObject).navigationBar.setBackgroundImage(UIImage(named:"NavigationBar"), for:.default)
             //设置导航栏的背景颜色 （优先级低）
             (NavVCArr[i] as AnyObject).navigationBar.barTintColor = UIColor.orange
             //设置导航栏的字体颜色
             (NavVCArr[i] as AnyObject).navigationBar.titleTextAttributes =
             [NSForegroundColorAttributeName: UIColor.red]
             
             }
             */
            
            //tabbar底部工具栏背景颜色（以下两个都行）
            self.tabBar.barTintColor = UIColor.white
            self.tabBar.backgroundColor = UIColor.withHex(hexString: MJHColor)
            //tabbar字体颜色（选中和未选中）
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.lightGray], for: UIControlState.normal)
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.withHex(hexString: MJHColor)], for: UIControlState.selected)
        }
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
