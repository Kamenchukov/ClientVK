//
//  FriendFotoViewController.swift
//  VkClient
//
//  Created by Константин Каменчуков on 07.03.2021.
//

import UIKit


class FriendFotoViewController: UICollectionViewController {

    
    var vkServices = VKServices()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        vkServices.loadPhotos()
    }

    

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FotoCell" , for: indexPath) as! FotoCell
        
       // if let name = 
            cell.foto.image = UIImage(named: "Matt")
      
           // cell.Foto.image = UIImage(systemName: "person")
        
//        cell.foto.image = UIImage(systemName: "person")
      
    
        return cell
    }

   
}
