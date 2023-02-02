

import UIKit
import Firebase

class FavoritesLoginController: UIViewController {
    
    let loginView = LoginView(frame: CGRect.zero)
    
    let favoritesRegisterController = FavoritesRegisterController()

    @objc func pushToFavoritesLoginController() {
        self.present(favoritesRegisterController, animated: true)
    }
    
   @objc func signInHandler() {
        guard let email = loginView.enterEmailTextField.text else { return }
        guard let password = loginView.passwordTextField.text else { return }
        loginUser(withEmail: email, password: password)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.enterEmailTextField.delegate = self
        loginView.passwordTextField.delegate = self
        view.addSubview(loginView)
        loginView.fillSuperview()
        loginView.orLabelRegisterButton.addTarget(self, action: #selector(pushToFavoritesLoginController), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(signInHandler), for: .touchUpInside)
    }
    
    func loginUser(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("Failed with sign user", error)
                return
            }
            
            print("Succefully logged user in...")
            
        }
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
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField == loginView.enterEmailTextField {
//            loginView.enterEmailTextField.text = "Enter your email"
//        } else if
//            textField == loginView.passwordTextField {
//                loginView.passwordTextField.text = "Enter your password"
//        }
//    }
}
