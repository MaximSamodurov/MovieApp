
import UIKit

class FavoritesView: UITableViewCell {
    
    let posterImage: UIImageView = {
        let pi = UIImageView()
        pi.downloaded(from: "")
        pi.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pi.heightAnchor.constraint(equalToConstant: 230).isActive = true
        pi.layer.cornerRadius = 10
        pi.clipsToBounds = true
        return pi
    }()
    
    let noImage: UIImageView = {
        let ni = UIImageView()
        ni.widthAnchor.constraint(equalToConstant: 150).isActive = true
        ni.heightAnchor.constraint(equalToConstant: 230).isActive = true
        ni.layer.cornerRadius = 10
        ni.image = UIImage(named: "no-image")
        ni.contentMode = .scaleAspectFit
        ni.clipsToBounds = true
        return ni
    }()
    
    let nameLabel = UILabel(text: "Movie Name", font: .boldSystemFont(ofSize: 24))
    let yearLabel = UILabel(text: "Year", font: .boldSystemFont(ofSize: 20))
    let movieType = UILabel(text: "Rating", font: .systemFont(ofSize: 20))
    
//    let deleteButton: UIButton = {
//        let li = UIButton()
//        let config = UIImage.SymbolConfiguration(pointSize: 20)
//        li.tintColor = .red
//        li.setImage(UIImage(systemName: "suit.heart", withConfiguration: config), for: .normal)
//        return li
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        
    
        
        let infoStackView = VerticalStackView(arrangedSubViews: [
            UIView(),
            nameLabel,
            yearLabel,
            movieType,
//            deleteButton
        ], spacing: 7)
        
        let infoAlignmentStackView = UIStackView(arrangedSubviews: [infoStackView])
        infoStackView.alignment = .center
        infoAlignmentStackView.alignment = .center
        
        let overalStackView = UIStackView(arrangedSubviews: [posterImage, infoAlignmentStackView])
        overalStackView.spacing = 12
        addSubview(overalStackView)
        overalStackView.fillSuperview(padding: .init(top: 0, left: 12, bottom: 0, right: 12))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}
