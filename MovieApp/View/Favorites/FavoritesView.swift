
import UIKit

class FavoritesView: UICollectionViewCell {
    
    let likeImage: UIButton = {
        let li = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        li.tintColor = .red
        li.setImage(UIImage(systemName: "suit.heart", withConfiguration: config), for: .normal)
        return li
    }()
    
    let titleMovieData = UILabel(text: "here is title in favorites", font: .boldSystemFont(ofSize: 25), numberOfLines: 0)

        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleMovieData)
        titleMovieData.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
