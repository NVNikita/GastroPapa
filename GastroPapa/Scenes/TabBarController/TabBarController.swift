//
//  TabBarController.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 24.12.2025.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarAppearance()
        setupViewControllers()
    }
    
    private func setupTabBarAppearance() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .clear
            appearance.shadowColor = UIColor.clear
            
            // цвет выбранной иконки
            appearance.stackedLayoutAppearance.selected.iconColor = .redForTabBar
            
            // цвет невыбранной иконки
            appearance.stackedLayoutAppearance.normal.iconColor = .white
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
            
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        } else {
            // для iOS 14 и ниже
            tabBar.tintColor = .redForTabBar
            tabBar.unselectedItemTintColor = .white
            tabBar.backgroundColor = .clear
        }
        
        // делаем таббар прозрачным
        tabBar.isTranslucent = true
    }
    
    private func createNewViewController(
        rootViewController: UIViewController,
        title: String?,
        imageName: String,
        selectedImageName: String
    ) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        let tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageName),
            selectedImage: UIImage(systemName: selectedImageName))
        
        navigationController.tabBarItem = tabBarItem
        rootViewController.navigationItem.title = title
        
        return navigationController
    }
    
    private func setupViewControllers() {
        let menuVC = createNewViewController(
            rootViewController: MenuViewController(),
            title: nil,
            imageName: "house",
            selectedImageName: "house")
        
        let favoriteVC = createNewViewController(
            rootViewController: FavoriteViewController(),
            title: nil,
            imageName: "heart",
            selectedImageName: "heart")
        
        let profileVC = createNewViewController(
            rootViewController: ProfileViewController(),
            title: nil,
            imageName: "person",
            selectedImageName: "person")
        
        let historyVC = createNewViewController(
            rootViewController: HistoryViewController(),
            title: nil,
            imageName: "clock.arrow.trianglehead.counterclockwise.rotate.90",
            selectedImageName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
        
        viewControllers = [menuVC, favoriteVC, profileVC, historyVC]
        selectedIndex = 0
    }
}
