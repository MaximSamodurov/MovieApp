
import UIKit

class MovieSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate let cellId = "cellId"
    fileprivate let footerId = "footerId"
    let searchLoadingFooter = SearchLoadingFooter()
    
    fileprivate let findAnyFilm: UILabel = {
        let label = UILabel()
        label.text = "Enter name of the movie..."
//        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // pass the imdbID Code to FullInfoMovieController
        let items = movieResult[indexPath.item]
        let fullInfoMovieController = FullInfoMovieController(selectedItem: items.imdbID)
          navigationController?.pushViewController(fullInfoMovieController, animated: true)
      }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(SearchLoadingFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
        setupSearchBar()
        collectionView.addSubview(findAnyFilm)
        findAnyFilm.fillSuperview(padding: .init(top: 100, left: 70, bottom: 0, right: 70))
        findAnyFilm.textAlignment = .center
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionFooter {
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
                footer.addSubview(searchLoadingFooter)
                searchLoadingFooter.activityIndicator.centerInSuperview()
                searchLoadingFooter.frame = CGRect(x: 0, y: 0, width: collectionView.bounds.width, height: 50)
                return footer
            }
            return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        .init(width: view.frame.width, height: 100	)
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    var timer: Timer?
    var paginationDigit = "1"
    var searchTextChanged = ""
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchTextChanged = searchText
        
     
        timer?.invalidate()
        // to delay for searching after start typing
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            
            Service.shared.fetchData(searchTerm: searchText, pagination: self.paginationDigit) { (results, error) in
                
                if let error = error {
                    print("Failed to fetch movies", error)
                    return
                }
                self.movieResult = results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    var movieResult = [Search]()
    
    fileprivate func fetchMovie() {
        Service.shared.fetchData(searchTerm: "", pagination: "1") { results, error in
            
            if let error = error {
                print("Failed to fetch data", error)
                return
            }
            
            self.movieResult = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        findAnyFilm.isHidden = movieResult.count != 0
        return movieResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 230)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        let result = movieResult[indexPath.item]
        cell.nameLabel.text = result.title
        cell.yearLabel.text = result.year
        cell.posterImage.downloaded(from: result.poster)
        cell.movieType.text = result.type
        
        if indexPath.item == movieResult.count - 1 {
            
            searchLoadingFooter.activityIndicator.startAnimating()
            
            let nextPaginationDigit = String((movieResult.count / 10) + 1)
            // передать в searchTerm текущий фильм
            Service.shared.fetchData(searchTerm: searchTextChanged, pagination: nextPaginationDigit) { results, error in

                if let error = error {
                    print("Failed to fetch Data", error)
                    return
                }
                
                sleep(2)
                
                self.movieResult += results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        return cell
    }
}
