
import UIKit

class SearchLoadingFooter: UICollectionReusableView {
    
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        activityIndicator.color = .darkGray
        addSubview(activityIndicator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
