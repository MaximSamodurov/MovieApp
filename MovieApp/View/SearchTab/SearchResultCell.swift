
import UIKit

class SearchResultCell: UICollectionViewCell {
    
    let posterImage: UIImageView = {
        let pv = UIImageView()
        pv.downloaded(from: "")
        pv.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pv.heightAnchor.constraint(equalToConstant: 230).isActive = true
        pv.layer.cornerRadius = 10
        pv.clipsToBounds = true
        return pv
    }()
    
    let nameLabel = UILabel(text: "Movie Name", font: .boldSystemFont(ofSize: 24))
    let yearLabel = UILabel(text: "Year", font: .boldSystemFont(ofSize: 20))
    let movieType = UILabel(text: "Rating", font: .systemFont(ofSize: 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let infoStackView = VerticalStackView(arrangedSubViews: [
        UIView(),
        nameLabel,
        yearLabel,
        movieType,
        ], spacing: 4)
        
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


