import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window?.rootViewController = BaseTabController()
        self.window?.makeKeyAndVisible()
        FirebaseApp.configure()
         
        return true
    }

}

