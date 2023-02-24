//
//import UIKit
//import Firebase
//
//class FavoritesController: BaseListController, UICollectionViewDelegateFlowLayout {
//
//    fileprivate let cellId = "cellId"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.register(FavoritesView.self, forCellWithReuseIdentifier: cellId)
//        self.collectionView.reloadData()
////        fetchFavorites()
//        navigationItem.hidesBackButton = true;
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutButton))
//        loadData()
//    }
//
//    @objc func logOutButton() {
//        do {
//            try Auth.auth().signOut()
//            print("Log Out succefully")
//        } catch {
//            print(error.localizedDescription)
//        }
//        self.navigationController?.popViewController(animated: true)
//    }
//
//    var favoritesSave = Array<FavoritesSave>()
//
//    private func loadData() {
//        let uid = Auth.auth().currentUser?.uid
//        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value) { snapshot in
//            print(snapshot)
//            var saveArray = Array<FavoritesSave>()
//            for item in snapshot.children {
//
//                let favoritesSave = FavoritesSave(snapshot: item as! DataSnapshot)
//                print(favoritesSave)
//                saveArray.append(favoritesSave)
//            }
//            self.favoritesSave = saveArray
//            self.collectionView.reloadData()
//        }
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return favoritesSave.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FavoritesView
//        let result = favoritesSave[indexPath.item]
//        cell.nameLabel.text = result.title
//        cell.yearLabel.text = result.year
//        cell.movieType.text = result.genre
//        if result.picture != "N/A" {
//            cell.posterImage.downloaded(from: result.picture)
//        } else {
//            cell.posterImage.image = cell.noImage.image
//        }
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        .init(width: view.frame.width, height: 230)
//    }
//}
//
//


import UIKit
import Firebase

class FavoritesController: UITableViewController {
 
    fileprivate let cellId = "cellId"
                
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FavoritesView.self, forCellReuseIdentifier: cellId)
        self.tableView.reloadData()
//        fetchFavorites()
        navigationItem.hidesBackButton = true;
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutButton))
        loadData()
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

    var favoritesSave = Array<FavoritesSave>()
    
    private func loadData() {
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value) { snapshot in
            var saveArray = Array<FavoritesSave>()
            for item in snapshot.children {
                let favoritesSave = FavoritesSave(snapshot: item as! DataSnapshot)
                saveArray.append(favoritesSave)
            }
            self.favoritesSave = saveArray
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoritesSave.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FavoritesView
        let result = favoritesSave[indexPath.row]
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        .init(230)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let favorites = favoritesSave[indexPath.row]
            favorites.ref?.removeValue()
        }
    }
    
}


