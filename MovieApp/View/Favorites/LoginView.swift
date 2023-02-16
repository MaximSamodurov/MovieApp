

import UIKit

class LoginView: UIView {
    
    let enterEmailTextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
//        textfield.text = "Enter your email"
        textfield.text = "test@ya.ru"
        textfield.textColor = .gray
        return textfield
    }()
    
    let passwordTextField = {
        let pass = UITextField()
        pass.borderStyle = .roundedRect
//        pass.text = "Enter your password"
        pass.text = "123456"
        pass.textColor = .gray
        return pass
    }()
    
    let loginButton = {
        let button = UIButton()
        button.tintColor = .blue
        button.setImage(UIImage(named: "login"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        return button
    }()
    
    let orLabelRegisterButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Or click to register", for: .normal)
        button.setTitleColor(.black, for: .normal   )
        return button
    }()

    
    override init(frame: CGRect) {
      super.init(frame: frame)
          
        backgroundColor = .white
        
        addSubview(enterEmailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(orLabelRegisterButton)
        
        enterEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        orLabelRegisterButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            enterEmailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            enterEmailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 300),
            enterEmailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            enterEmailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            passwordTextField.topAnchor.constraint(equalTo: enterEmailTextField.bottomAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 44),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -44),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            
            orLabelRegisterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            orLabelRegisterButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 0),
            orLabelRegisterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            orLabelRegisterButton.heightAnchor.constraint(equalToConstant: 44)

        ])
                    
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


