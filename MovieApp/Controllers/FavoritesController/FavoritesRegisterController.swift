

import UIKit

class FavoritesRegisterController: UIViewController {
    
    let registerView = RegisterView(frame: CGRect.zero)

//    @objc func pushToFavoritesLoginController() {
//        self.present(favoritesRegisterController, animated: true)
//        print("pushToFavoritesLoginControllerPressed")
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerView.enterEmailTextField.delegate = self
        registerView.passwordTextField.delegate = self
        view.addSubview(registerView)
        registerView.fillSuperview()
//        loginView.orLabelRegisterButton.addTarget(self, action: #selector(pushToFavoritesLoginController), for: .touchUpInside)
        
    }
}

extension FavoritesRegisterController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == registerView.enterEmailTextField {
            registerView.enterEmailTextField.text?.removeAll()
        } else if
            textField == registerView.passwordTextField {
            registerView.passwordTextField.text?.removeAll()
        }
    }
}
