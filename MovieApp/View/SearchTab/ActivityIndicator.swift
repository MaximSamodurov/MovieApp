

import UIKit

public protocol ActivityIndicator {
    
    /// The activity indicator
    var activityIndicator: UIActivityIndicatorView { get }
    
    /// Show the activity indicator in the view
    func showActivityIndicator()
    
    /// Hide the activity indicator in the view
    func hideActivityIndicator()
}

public extension ActivityIndicator where Self: UIViewController {
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            
            self.activityIndicator.style = .large
            self.activityIndicator.color = .darkGray
            self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 80, height: 80) //or whatever size you would like
            self.activityIndicator.center = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.height / 2)
            self.view.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
        }
    }
}
