

import UIKit

class FullInfoMovieController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(FullInfoMovieCell.self, forCellWithReuseIdentifier: cellId)
        fetchData()
    }
    
    func fetchData() {
        
        let url = "https://www.omdbapi.com/?i=tt1285016&apikey=1918ecd5"
        
        guard let urlString = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: urlString) { data, response, error in
            
            if let error = error {
                print("error fetch", error)
            }
            
            print(String(data: data!, encoding: .utf8))
            
        }.resume()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FullInfoMovieCell
        cell.fullPosterImage.downloaded(from: "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width , height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: -55, left: 0, bottom: 100, right: 0)
    }
}
