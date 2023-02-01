
import UIKit

class BaseTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: MovieSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: FavoritesLoginController(), title: "Favorites", imageName: "heart"),
        ]
        tabBar.backgroundColor = UIColor(white: 0.9, alpha: 1)
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController
        {
        
        let navController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
}
