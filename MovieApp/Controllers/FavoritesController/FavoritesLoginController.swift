

import UIKit

class FavoritesLoginController: UIViewController {
    
    let loginView = LoginView(frame: CGRect.zero)
    
    let favoritesRegisterController = FavoritesRegisterController()

    @objc func pushToFavoritesLoginController() {
        self.present(favoritesRegisterController, animated: true)
//        navigationController?.pushViewController(favoritesRegisterController, animated: true)
        print("pushToFavoritesLoginControllerPressed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.enterEmailTextField.delegate = self
        loginView.passwordTextField.delegate = self
        view.addSubview(loginView)
        loginView.fillSuperview()
        loginView.orLabelRegisterButton.addTarget(self, action: #selector(pushToFavoritesLoginController), for: .touchUpInside)
        
    }
}

extension FavoritesLoginController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == loginView.enterEmailTextField {
            loginView.enterEmailTextField.text?.removeAll()
        } else if
            textField == loginView.passwordTextField {
            loginView.passwordTextField.text?.removeAll()
        }
    }
}
