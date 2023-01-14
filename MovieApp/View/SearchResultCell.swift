
import UIKit

class SearchResultCell: UICollectionViewCell {
    
    let posterImage: UIImageView = {
        let pv = UIImageView()
        pv.downloaded(from: "")
        pv.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pv.heightAnchor.constraint(equalToConstant: 230).isActive = true
//        pv.backgroundColor = .red
        pv.layer.cornerRadius = 16
        pv.clipsToBounds = true
        return pv
    }()
    
    let nameLabel = UILabel(text: "Movie Name", font: .boldSystemFont(ofSize: 24))
    let yearLabel = UILabel(text: "Year", font: .boldSystemFont(ofSize: 20))
    let ratingLabel = UILabel(text: "Rating", font: .systemFont(ofSize: 20))
    let realeaseDate = UILabel(text: "Release date", font: .systemFont(ofSize: 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let infoStackView = VerticalStackView(arrangedSubViews: [
        UIView(),
        nameLabel,
        yearLabel,
        ratingLabel,
        realeaseDate
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

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
