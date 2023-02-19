

import UIKit

class FullInfoMovieController: BaseListController, UICollectionViewDelegateFlowLayout, ActivityIndicator {

    let cellId = "cellId"
    let activityIndicator = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        collectionView.register(FullInfoMovieCell.self, forCellWithReuseIdentifier: cellId)
        fetchFullInfo()
    }

    // init for captured data (imbdID Code) from Movie Search Controller
     init(selectedItem: String) {
        self.selectedItem = selectedItem
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var fullIInfoMovieResult: FullIInfoMovieResult?

    // capture data from init
    private let selectedItem: String

    func fetchFullInfo() {
        Service.shared.fetchFullInfo(selectedItem: selectedItem) { result, error in

            if let error = error {
                print("Error with fullInfo", error)
            }

            self.fullIInfoMovieResult = result

            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            self.hideActivityIndicator()
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FullInfoMovieCell
        cell.titleMovieData.text = fullIInfoMovieResult?.title
        cell.descriptionMovieData.text = fullIInfoMovieResult?.plot
        cell.directorMovieData.text = fullIInfoMovieResult?.director
        cell.genreMovieData.text = fullIInfoMovieResult?.genre
        cell.actorsMoviewData.text = fullIInfoMovieResult?.actors
        cell.awardsMovieData.text = fullIInfoMovieResult?.awards
        cell.yearData.text = fullIInfoMovieResult?.year

        if fullIInfoMovieResult?.poster != "N/A" {
            cell.fullPosterImage.downloaded(from: fullIInfoMovieResult?.poster ?? "")
        } else {
            cell.fullPosterImage.image = UIImage(named: "no-image")
        }
        cell.likeButton.addTarget(self, action: #selector(likeButtonDidTapped), for: .touchUpInside)
        
        return cell
    }
    
    var isButtonLiked = false

    // сделать так что бы кнопка реагировала как тумблер
    @objc func likeButtonDidTapped() {
        if isButtonLiked == false {
            StorageService.shared.store(title: fullIInfoMovieResult?.title ?? "", year: fullIInfoMovieResult?.year ?? "", genre: fullIInfoMovieResult?.genre ?? "", pic: fullIInfoMovieResult?.poster ?? "")
            isButtonLiked = true
        } else {
//            StorageService.shared.imbd.removeAll { title in
//                return title == fullIInfoMovieResult?.imdbID
//            }
            print("delete")
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width , height: view.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: -55, left: 0, bottom: 100, right: 0)
    }
}




