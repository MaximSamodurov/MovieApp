

import UIKit
import Firebase

class FavoritesLoginController: UIViewController {
    
    let loginView = LoginView(frame: CGRect.zero)
    let favoritesController = FavoritesController()
    let favoritesRegisterController = FavoritesRegisterController()
    
    // Transition to Register Controller if click "Or click to register" text
    @objc func pushToFavoritesLoginController() {
        self.present(favoritesRegisterController, animated: true)
    }
    
    // Transition to Favorites Controller if login and password correct and already register in firebase
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
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: nil, action: nil)
        
        // if user already logined make transition to favorites
        
//        Auth.auth().addStateDidChangeListener { auth, user in
//            if user != nil {
//                self.navigationController?.pushViewController(self.favoritesController, animated: true)
//            }
//        }
    }
        
    // Firebase Login
    func loginUser(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed with sign user", error)
                let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                return
            }
            
            self.navigationController?.pushViewController(self.favoritesController, animated: true)
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
            loginView.passwordTextField.isSecureTextEntry = true
        }
    }
}


