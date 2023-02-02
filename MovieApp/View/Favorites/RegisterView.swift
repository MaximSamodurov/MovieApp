
import UIKit

class RegisterView: UIView {
    
    let enterEmailTextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.text = "Enter your email"
        textfield.textColor = .gray
        return textfield
    }()
    
    let passwordTextField = {
        let pass = UITextField()
        pass.borderStyle = .roundedRect
        pass.text = "Enter your password"
        pass.textColor = .gray
        return pass
    }()
    
    let repeatPasswordTextField = {
        let pass = UITextField()
        pass.borderStyle = .roundedRect
        pass.text = "Repeat your password"
        pass.textColor = .gray
        return pass
    }()
    
    let registerButton = {
        let button = UIButton()
        button.tintColor = .blue
        button.setImage(UIImage(named: "login"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
          
        backgroundColor = .white
        
        addSubview(enterEmailTextField)
        addSubview(passwordTextField)
        addSubview(repeatPasswordTextField)
        addSubview(registerButton)
        
        enterEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        repeatPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            enterEmailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            enterEmailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            enterEmailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            enterEmailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            passwordTextField.topAnchor.constraint(equalTo: enterEmailTextField.bottomAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            repeatPasswordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            repeatPasswordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 44),
            registerButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -44),
            registerButton.heightAnchor.constraint(equalToConstant: 44),

        ])
                    
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


