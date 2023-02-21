
import UIKit
import Firebase

class FavoritesController: BaseListController, UICollectionViewDelegateFlowLayout {
 
    fileprivate let cellId = "cellId"
            
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(FavoritesView.self, forCellWithReuseIdentifier: cellId)
        self.collectionView.reloadData()
//        fetchFavorites()
        navigationItem.hidesBackButton = true;
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutButton))
    }
    
    @objc func logOutButton() {
        do {
            try Auth.auth().signOut()
            print("Log Out succefully")
        } catch {
            print(error.localizedDescription)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    var favoritesResult: FavoritesResult?

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StorageService.shared.favoritesObjectArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FavoritesView
        let result = StorageService.shared.retrieve()[indexPath.item]
        cell.nameLabel.text = result.title
        cell.yearLabel.text = result.year
        cell.movieType.text = result.genre
        if result.picture != "N/A" {
            cell.posterImage.downloaded(from: result.picture)
        } else {
            cell.posterImage.image = cell.noImage.image
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 230)
    }
    
}


