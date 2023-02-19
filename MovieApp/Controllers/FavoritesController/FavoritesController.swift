
import UIKit

class FavoritesController: BaseListController, UICollectionViewDelegateFlowLayout {
 
    fileprivate let cellId = "cellId"
            
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(FavoritesView.self, forCellWithReuseIdentifier: cellId)
        self.collectionView.reloadData()
        fetchFavorites()
    }
    
    var favoritesResult: FavoritesResult?
    
//    var searchTerm = StorageService.shared.retrive()
    
    func fetchFavorites() {
        
        // передать сюда searchTerm
        Service.shared.fetchFavorites(searchTerm: "tt3896198") { (results, error) in
            
            if let error = error {
                print("Failed to fetch movies", error)
                return
            }
            
            self.favoritesResult = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return StorageService.shared.retriveTitleArray().count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FavoritesView
        let title = StorageService.shared.retriveTitleArray()[indexPath.item]
        let year = StorageService.shared.retriveYearArray()[indexPath.item]
        let genre = StorageService.shared.retriveGenreArray()[indexPath.item]
        let pic = StorageService.shared.retrivePicArray()[indexPath.item]
        cell.nameLabel.text = title
        cell.yearLabel.text = year
        cell.movieType.text = genre
        if pic != "N/A" {
            cell.posterImage.downloaded(from: pic)
        } else {
            cell.posterImage.image = cell.noImage.image
        }
//        cell.movieType.text = result?.genre
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 230)
    }
    
}


