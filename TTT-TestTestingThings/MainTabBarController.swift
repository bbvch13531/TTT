//
//  MainTabBarController.swift
//  TTT-TestTestingThings
//
//  Created by KyungYoung Heo on 2021/12/03.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        UITabBar.appearance().tintColor = .systemBackground
        
        setupVC()
    }
    
    func setupVC() {
        viewControllers = [
            createNaviController(for: TTTViewController(viewModel: TTTViewModel()),
                                    title: "TTT",
                                    image: UIImage(systemName: "house")!),
            createNaviController(for: TTTViewController(viewModel: TTTViewModel()),
                                    title: "TTT1",
                                    image: UIImage(systemName: "person")!)
        ]
    }
    
    fileprivate func createNaviController(for rootVC: UIViewController,
                                 title: String,
                                 image: UIImage) -> UIViewController {
        let naviController = UINavigationController(rootViewController: rootVC)
        naviController.tabBarItem.title = title
        naviController.tabBarItem.image = image
        naviController.navigationBar.prefersLargeTitles = true
        
        rootVC.navigationItem.title = title
        
        return naviController
    }
}
