

import UIKit

class FavoritesLoginController: UIViewController  {
    
    let loginView = LoginView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(loginView)
        loginView.fillSuperview()
    }
}
