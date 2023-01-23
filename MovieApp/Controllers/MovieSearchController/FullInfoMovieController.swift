

import UIKit

class FullInfoMovieController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
//    let movieSearchController = MovieSearchController()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(FullInfoMovieCell.self, forCellWithReuseIdentifier: cellId)
        fetchFullInfo()
    }
    
    private let selectedItem: String
    
     init(selectedItem: String) {
        self.selectedItem = selectedItem
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var fullIInfoMovieResult: FullIInfoMovieResult?
    
    func fetchFullInfo() {
    
        let url = "https://www.omdbapi.com/?i=\(selectedItem)&apikey=1918ecd5"
        
        guard let urlString = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: urlString) { data, response, error in
            
            if let error = error {
                print("error fetch", error)
            }
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(FullIInfoMovieResult.self, from: data)
                
                self.fullIInfoMovieResult = searchResult
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            } catch {
                print("Failed to decode", error)
            }
            
        }.resume()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FullInfoMovieCell
        cell.titleMovieData.text = fullIInfoMovieResult?.Title
        cell.descriptionMovieData.text = fullIInfoMovieResult?.Plot
        cell.directorMovieData.text = fullIInfoMovieResult?.Director
        cell.genreMovieData.text = fullIInfoMovieResult?.Genre
        cell.actorsMovieTitle.text = fullIInfoMovieResult?.Actors
        cell.awardsMovieData.text = fullIInfoMovieResult?.Awards
        cell.yearData.text = fullIInfoMovieResult?.Year
        cell.fullPosterImage.downloaded(from: fullIInfoMovieResult?.Poster ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width , height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: -55, left: 0, bottom: 100, right: 0)
    }
}
