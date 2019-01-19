//
//  MainTabBarController.swift
//  mshack
//
//  Created by Apurva Raj on 19/01/19.
//  Copyright © 2019 Apurva Raj. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.tabBar.isTranslucent = false

        setupViewControllers()
        
    }
    
    func setupViewControllers() {
        
        let rewardsController = templateController(title: "Rewards", unselectedImage: #imageLiteral(resourceName: "premium-badge"), selectedImage: #imageLiteral(resourceName: "premium-badge"),rootViewController: RewardsController())
        
        let bookingsController = templateController(title: "Travel", unselectedImage: #imageLiteral(resourceName: "airplane-around-earth"), selectedImage: #imageLiteral(resourceName: "airplane-around-earth"),rootViewController: BookingsController())
        
        let profileController = templateController(title: "Profile", unselectedImage: #imageLiteral(resourceName: "user"), selectedImage: #imageLiteral(resourceName: "user"),rootViewController: ProfileController())

        viewControllers = [rewardsController, bookingsController, profileController]
        
        tabBar.tintColor = UIColor.rgb(red: 41, green: 128, blue: 185, alpha: 1)
        
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
        }
    }
    

    
    fileprivate func templateController(title: String, unselectedImage: UIImage, selectedImage: UIImage,
                                        rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        navController.tabBarItem.title = title
        
        return navController
    }


}
