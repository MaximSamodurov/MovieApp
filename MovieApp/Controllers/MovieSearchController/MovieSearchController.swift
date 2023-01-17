

import UIKit

class MovieSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate let cellId = "cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        setupSearchBar()
        fetchMovie()
    }
    
    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        // to delay for searching after start typing
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            
            Service.shared.fetchData(searchTerm: searchText) { (results, error)  in
                
                if let error = error {
                    print("Failed to fetch apps", error)
                    return
                }
                
                self.movieResult = results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    fileprivate var movieResult = [Search]()
    
    fileprivate func fetchMovie() {
        Service.shared.fetchData(searchTerm: "") { results, error in
            
            if let error = error {
                print("Failed to fetch Data", error)
                return
            }
            
            self.movieResult = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
//    fileprivate func fetchMovie() {
//
//        let url = URL(string: "https://www.omdbapi.com/?i=tt3896198&apikey=1918ecd5&s=Inception")!
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//
//            if let error = error {
//                print("error fetching", error)
//            }
//
//            guard let data = data else { return }
//
//            do {
//              let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
//
//                self.appResult = searchResult.Search
//
//                searchResult.Search.forEach({print($0.Year, $0.Title)})
//
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
//            } catch {
//                print("Failed to decode", error)
//            }
//        } .resume()
//    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 230)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        let movieResult = movieResult[indexPath.item]
        cell.nameLabel.text = movieResult.Title
        cell.yearLabel.text = movieResult.Year
        cell.posterImage.downloaded(from: movieResult.Poster)
        cell.movieType.text = movieResult.type
        return cell
    }
    
}
