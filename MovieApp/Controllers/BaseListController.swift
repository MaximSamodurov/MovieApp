
import UIKit

class BaseListController: UICollectionViewController  {
    
    // this init allows to create collection without parameters, avoid non layout errors and crash App
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
