

import UIKit
import Firebase

class FavoritesRegisterController: UIViewController {
    
    let registerView = RegisterView(frame: CGRect.zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        registerView.enterEmailTextField.delegate = self
        registerView.passwordTextField.delegate = self
        registerView.repeatPasswordTextField.delegate = self
        view.addSubview(registerView)
        registerView.fillSuperview()
        registerView.registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    }
    
    @objc func handleRegister() {
        guard let email = registerView.enterEmailTextField.text else { return }
        guard let password = registerView.passwordTextField.text else { return }
        createUser(withEmail: email, password: password)
    }
    
    
    // MARK: - API
    
    func createUser(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("Failed to signUp user", error)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            let values = ["email": email]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: {(error, ref) in
                
                if let error = error {
                    print("Failed to updateDatabase values", error)
                    return
                }
                
                print("Succesfully Signed Up User")
                
            })
            
        }
    }
}

extension FavoritesRegisterController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == registerView.enterEmailTextField {
            registerView.enterEmailTextField.text?.removeAll()
        } else if
            textField == registerView.passwordTextField {
            registerView.passwordTextField.text?.removeAll()
        } else if
            textField == registerView.repeatPasswordTextField {
            registerView.repeatPasswordTextField.text?.removeAll()
        }
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField == registerView.enterEmailTextField {
//            registerView.enterEmailTextField.text = "Enter your email"
//        } else if
//            textField == registerView.passwordTextField {
//            registerView.passwordTextField.text = "Enter your password"
//        } else if
//            textField == registerView.repeatPasswordTextField {
//            registerView.repeatPasswordTextField.text = "Repeat your password"
//        }
//    }
}
