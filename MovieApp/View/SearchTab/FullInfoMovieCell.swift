
import UIKit

class FullInfoMovieCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout {
    
    let fullPosterImage: UIImageView = {
        let pv = UIImageView()
        pv.downloaded(from: "")
//        pv.widthAnchor.constraint(equalToConstant: 500).isActive = true
//        pv.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        pv.contentMode = .scaleAspectFill
        pv.clipsToBounds = true
        pv.layer.cornerRadius = 15
        return pv
    }()
    
//    let titleMovieTitle = UILabel(text: "Name", font: .boldSystemFont(ofSize: 18))
    let descriptionMovieTitle = UILabel(text: "Description", font: .boldSystemFont(ofSize: 16))
    let directorMovieTitle = UILabel(text: "Director ", font: .boldSystemFont(ofSize: 16))
    let genreMovieTitle = UILabel(text: "Genre", font: .boldSystemFont(ofSize: 16))
    let actorsMovieTitle = UILabel(text: "Actors", font: .boldSystemFont(ofSize: 16))
    let awardsMovieTitle = UILabel(text: "Awards", font: .boldSystemFont(ofSize: 16))
    let yearTitle = UILabel(text: "Release Date", font: .boldSystemFont(ofSize: 16))
    

    let titleMovieData = UILabel(text: "", font: .boldSystemFont(ofSize: 25), numberOfLines: 0)
    let descriptionMovieData = UILabel(text: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.", font: .systemFont(ofSize: 15), numberOfLines: 0)
    let directorMovieData = UILabel(text: "Christopher Nolan", font: .systemFont(ofSize: 15), numberOfLines: 0)
    let genreMovieData = UILabel(text: "Action, Adventure, Sci-Fi", font: .systemFont(ofSize: 15), numberOfLines: 0)
    let actorsMoviewData = UILabel(text: "Leonardo DiCaprio, Joseph Gordon-Levitt, Elliot Page", font: .systemFont(ofSize: 15), numberOfLines: 0)
    let awardsMovieData = UILabel(text: "Won 4 Oscars. 158 wins & 220 nominations total", font: .systemFont(ofSize: 15), numberOfLines: 0)
    let yearData = UILabel(text: "16 Jul 2010", font: .systemFont(ofSize: 15), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let title = VerticalStackView(arrangedSubViews: [
            titleMovieData
        ], spacing: 1)
        let description = VerticalStackView(arrangedSubViews: [
            descriptionMovieTitle,
            descriptionMovieData
        ], spacing: 1)
        let director = VerticalStackView(arrangedSubViews: [
        directorMovieTitle,
        directorMovieData
        ], spacing: 1)
        let genre = VerticalStackView(arrangedSubViews: [
        genreMovieTitle,
        genreMovieData
        ], spacing: 1)
        let actors = VerticalStackView(arrangedSubViews: [
        actorsMovieTitle,
        actorsMoviewData
        ], spacing: 1)
        let awards = VerticalStackView(arrangedSubViews: [
        awardsMovieTitle,
        awardsMovieData
        ], spacing: 1)
        let year = VerticalStackView(arrangedSubViews: [
        yearTitle,
        yearData
        ], spacing: 1)
        
        let textStackView = VerticalStackView(arrangedSubViews: [title, description, director, genre, actors, awards, year ], spacing: 8)
        let overalStackView = VerticalStackView(arrangedSubViews: [fullPosterImage, textStackView], spacing: 5)
        addSubview(overalStackView)

                
        overalStackView.fillSuperview(padding: .init(top: 0, left: 12, bottom: -100, right: 12))
               
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

