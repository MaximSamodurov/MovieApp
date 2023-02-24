

import UIKit
import Firebase

class FavoritesRegisterController: UIViewController {
    
    let registerView = RegisterView(frame: CGRect.zero)
    let favoritesController = FavoritesController()
    var ref: DatabaseReference!
    let user: User! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        registerView.enterEmailTextField.delegate = self
        registerView.passwordTextField.delegate = self
        registerView.repeatPasswordTextField.delegate = self
        view.addSubview(registerView)
        registerView.fillSuperview()
        registerView.registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        ref = Database.database().reference(withPath: "users")
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: nil, action: nil)
    }
    
    
    // create user by Register button p.s. change button from LOGIN to register
    @objc func handleRegister() {
        guard let email = registerView.enterEmailTextField.text else { return }
        guard let password = registerView.passwordTextField.text else { return }
        // check if password field and passwordRepeat field are the same
        if password == registerView.repeatPasswordTextField.text {
            createUser(withEmail: email, password: password)
            // if not show alert
        } else {
            let alert = UIAlertController(title: "Error", message: "Passwords are not the same", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    
    // Firebase Create User
    func createUser(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("Failed to signUp user", error)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let values = ["email": email]
            3
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { [weak self] (error, ref) in
                
                if let error = error {
                    print("Failed to updateDatabase values", error)
                    return
                }
                let userRef = self?.ref.child((self?.user.uidData)!)
                userRef?.setValue(["email": self?.user.emailData])
                print("Succesfully Signed Up User")
                #warning("НЕ РАБОТЕТ ПЕРЕХОД НА FavoritesController")
            })
        }
    }
}

// MARK: - Extensions

extension FavoritesRegisterController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == registerView.enterEmailTextField {
            registerView.enterEmailTextField.text?.removeAll()
        } else if
            textField == registerView.passwordTextField {
            registerView.passwordTextField.text?.removeAll()
            registerView.passwordTextField.isSecureTextEntry = true
        } else if
            textField == registerView.repeatPasswordTextField {
            registerView.repeatPasswordTextField.text?.removeAll()
            registerView.repeatPasswordTextField.isSecureTextEntry = true
        }
    }
}
