//
//  TabBarController.swift
//  DaangnMarket-iOS
//
//  Created by 황찬미 on 2022/08/07.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbar()
    }
    
    // MARK: - Custom Method
    
    private func setTabbar() {
        view.backgroundColor = .white
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "", image: Constant.Image.icHome, selectedImage: Constant.Image.icHomeSelected)
        let neighborhoddVC = UINavigationController(rootViewController: NeighborhoodViewController())
        neighborhoddVC.tabBarItem = UITabBarItem(title: "", image: Constant.Image.icNeighbohood, selectedImage: Constant.Image.icNeighbohoodSelected)
        let myPlaceVC = UINavigationController(rootViewController: MyPlaceViewController())
        myPlaceVC.tabBarItem = UITabBarItem(title: "", image: Constant.Image.icMyPlace, selectedImage: Constant.Image.icMyPlaceSelected)
        let chatVC = UINavigationController(rootViewController: ChatViewController())
        chatVC.tabBarItem = UITabBarItem(title: "", image: Constant.Image.icChat, selectedImage: Constant.Image.icChatSelected)
        let myDaangnVC = UINavigationController(rootViewController: MyDaangnViewController())
        myDaangnVC.tabBarItem = UITabBarItem(title: "", image: Constant.Image.icMyDaangn, selectedImage: Constant.Image.icMyDaangnSelected)
        
        viewControllers = [homeVC, neighborhoddVC, myPlaceVC, chatVC, myDaangnVC]
    }

}
