

import UIKit

class FavoritesLoginController: UIViewController {
    
    let loginView = LoginView(frame: CGRect.zero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.enterEmailTextField.delegate = self
        loginView.passwordTextField.delegate = self
        view.addSubview(loginView)
        loginView.fillSuperview()
        loginView.enterEmailTextField.resignFirstResponder()
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
