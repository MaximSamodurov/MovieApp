

import UIKit

class LoginView: UIView {
    
    let enterEmailTextField = UITextField()
    let passwordTextField = UITextField()
    let repeatPasswordTextField = UITextField()
    let loginButton = UIButton()
    let orLabel = UILabel()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        
        backgroundColor = .red
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
