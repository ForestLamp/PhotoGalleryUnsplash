//
//  MainTabBarController.swift
//  PhotoGalleryUnsplash
//
//  Created by Alex Ch. on 01.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupControllers()
        
    }
    
    // MARK: - private methods
    
    private func setupControllers(){
        let photosVC = generateNavBarController(vc: PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()), title: "PhotoGalery", icon: #imageLiteral(resourceName: "photoGalery23x23"))
        let favoriteVC = generateNavBarController(vc: ViewController(), title: "Favorite", icon: #imageLiteral(resourceName: "favorite23x23"))
        viewControllers = [photosVC, favoriteVC]

    }
    
    private func generateNavBarController(vc: UIViewController, title: String, icon: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        navController.tabBarItem.image = icon
        vc.navigationItem.title = title
        return navController
    }
}
