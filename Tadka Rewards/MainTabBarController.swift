//
//  MainTabBarController.swift
//  Tadka Rewards
//
//  Created by Nihaal Manesia on 4/4/19.
//  Copyright © 2019 Nihaal Manesia. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //checkLoggedInUserStatus()
        
        setupViewControllers()
    }
    
    fileprivate func checkLoggedInUserStatus() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let welcomeController = WelcomeController()
                let welcomeNavigationController = UINavigationController(rootViewController: welcomeController)
                self.present(welcomeNavigationController, animated: false, completion: nil)
                return
            }
        }
    }
    
    fileprivate func setupViewControllers() {
        tabBar.tintColor = Service.selectedItemColor
        tabBar.unselectedItemTintColor = Service.unselectedItemColor
        
        let menuController = MenuController()
        let menuNavigationController = UINavigationController(rootViewController: menuController)
        //menuNavigationController.setNavigationBarHidden(true, animated: false)
        menuNavigationController.tabBarItem.image = #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysTemplate)
        menuNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysTemplate)
        menuNavigationController.tabBarItem.title = "Menu"
        
        let rewardsController = RewardsController()
        let rewardsNavigationController = UINavigationController(rootViewController: rewardsController)
        rewardsNavigationController.tabBarItem.image = #imageLiteral(resourceName: "rewards").withRenderingMode(.alwaysTemplate)
        rewardsNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "rewards").withRenderingMode(.alwaysTemplate)
        rewardsNavigationController.tabBarItem.title = "Rewards"
        
        let profileController = ProfileController()
        let profileNavigationController = UINavigationController(rootViewController: profileController)
        profileNavigationController.tabBarItem.image = #imageLiteral(resourceName: "profile").withRenderingMode(.alwaysTemplate)
        profileNavigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile").withRenderingMode(.alwaysTemplate)
        profileNavigationController.tabBarItem.title = "Profile"
        
        viewControllers = [menuNavigationController, rewardsNavigationController, profileNavigationController]
        
    }
}
