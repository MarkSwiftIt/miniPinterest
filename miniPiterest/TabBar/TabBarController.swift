//
//  TabBarController.swift
//  miniPiterest
//
//  Created by Mark Goncharov on 14.07.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        let photoVC = PhotoCollectionVC(collectionViewLayout: UICollectionViewLayout())
        
        viewControllers = [
            generateNavigationVC(rootViewController: photoVC,
                                 title: "Photo",
                                 image: #imageLiteral(resourceName: "photos")),
            generateNavigationVC(rootViewController: ViewController(),
                                 title: "Favourites",
                                 image: #imageLiteral(resourceName: "heart"))
        ]
        
        navigationController?.navigationBar.isHidden = true
    }
    
    
    private func generateNavigationVC(rootViewController: UIViewController,
                                      title: String,
                                      image: UIImage) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
