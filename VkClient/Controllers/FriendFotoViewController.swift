//
//  FriendFotoViewController.swift
//  VkClient
//
//  Created by Константин Каменчуков on 07.03.2021.
//

import UIKit
import RealmSwift

class FriendFotoViewController: UICollectionViewController {

    
    var vkServices = VKServices()
    var userId: Int?
    var photos: Results<UserPhoto>?
    var token: NotificationToken?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vkServices.loadPhotos(friendId: userId ?? 0)
        realmObserve()

    }

    

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FotoCell" , for: indexPath) as! FotoCell
        
//        if let image = photos[indexPath.item].photo604 {
//                    let imageURL = URL(string: image)!
//                    let data = try? Data(contentsOf: imageURL)
//                    cell.foto.image = UIImage(data: data!)
//                } else if let image = photos[indexPath.item].photo130 {
//                    let imageURL = URL(string: image)!
//                    let data = try? Data(contentsOf: imageURL)
//                    cell.foto.image = UIImage(data: data!)
//                } else {
//                    cell.foto.image = UIImage(systemName: "person.crop.circle")
//                         }
        guard let photo = photos?[indexPath.item] else { return cell}
        if let image = photo.photo604 {
                     let imageURL = URL(string: image)!
                     let data = try? Data(contentsOf: imageURL)
                    cell.foto.image = UIImage(data: data!)
                 } else if let image = photo.photo130 {
                     let imageURL = URL(string: image)!
                     let data = try? Data(contentsOf: imageURL)
                    cell.foto.image = UIImage(data: data!)
                 } else {
                    cell.foto.image = UIImage(systemName: "person.crop.circle")
                 }
//        cell.likes.numberOfLikes = photos[indexPath.item].likes.count
//        cell.likes.isLiked = (photos[indexPath.item].likes.userLikes != 0)
      
    
        return cell
    }

   
}

extension FriendFotoViewController {
    func realmObserve() {
             guard let realm = try? Realm() else { return }

             photos = realm.objects(UserPhoto.self).filter("ownerId = \(Int(userId!))")
             token = photos?.observe {[weak self] (changes: RealmCollectionChange) in

                 guard let self = self,
                       let collectionView = self.collectionView else { return }

                 switch changes {
                     case .initial:
                         collectionView.reloadData()
                     case .update(_, let deletions, let insertions, let modifications):
                         collectionView.performBatchUpdates({
                             collectionView.insertItems(at: insertions.map({ IndexPath(row: $0, section: 0) }))
                             collectionView.deleteItems(at: deletions.map({ IndexPath(row: $0, section: 0)}))
                             collectionView.reloadItems(at: modifications.map({ IndexPath(row: $0, section: 0) }))
                         }, completion: nil)
                     case .error(let error):
                         fatalError("\(error)")
                 }

             }

         }
}
