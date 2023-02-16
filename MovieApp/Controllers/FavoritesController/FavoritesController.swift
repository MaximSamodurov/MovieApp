
import UIKit

class FavoritesController: BaseListController, UICollectionViewDelegateFlowLayout {
 
    fileprivate let cellId = "cellId"
    
    let favoritesView = FavoritesView()
    
    var testPassInfo = "here is test pass info"
    
    // если включить этот объект то приложение не запускается
    // let movieSearchController = MovieSearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(FavoritesView.self, forCellWithReuseIdentifier: cellId)
        // разобраться почему нужно этот объект пихать в вью дид лоад Хотя другие в других контрллерах оставлял вне viewDidLoad
        // наверно поотому что это контроллер а не вью как в кейсах до этого
        // let movieSearchController = MovieSearchController()
        self.collectionView.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StorageService.shared.retrive().count
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FavoritesView
        let title = StorageService.shared.retrive()[indexPath.item]
        cell.titleMovieData.text = title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 230)
    }
    
}


