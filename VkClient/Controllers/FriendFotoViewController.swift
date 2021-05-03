//
//  FriendFotoViewController.swift
//  VkClient
//
//  Created by Константин Каменчуков on 07.03.2021.
//

import UIKit


class FriendFotoViewController: UICollectionViewController {

    
    var vkServices = VKServices()
    var userId: Int?
    var photos = [UserPhoto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        vkServices.loadPhotos(friendId: userId!) {[weak self] photos in
                     self?.photos = photos
                     self?.collectionView.reloadData()
                 }
    }

    

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FotoCell" , for: indexPath) as! FotoCell
        
        if let image = photos[indexPath.item].photo604 {
                    let data = try? Data(contentsOf: image)
                    cell.foto.image = UIImage(data: data!)
                } else if let image = photos[indexPath.item].photo130 {
                    let data = try? Data(contentsOf: image)
                    cell.foto.image = UIImage(data: data!)
                } else {
                    cell.foto.image = UIImage(systemName: "person.crop.circle")
                         }
//        cell.likes.numberOfLikes = photos[indexPath.item].likes.count
//        cell.likes.isLiked = (photos[indexPath.item].likes.userLikes != 0)
      
    
        return cell
    }

   
}
