//
//  CommunitiesViewController.swift
//  VkClient
//
//  Created by Константин Каменчуков on 03.03.2021.
//

import UIKit

class CommunitiesViewController: UITableViewController {
   // @IBOutlet weak var communityName: UILabel!
    
    var allCommunity: [CommunitiesOfUser] = []
    var vkServices = VKServices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vkServices.loadCommunities()
        
    }
    //MARK: - Seques
    @IBAction func unwindFromAllCommunities(_ sender: UIStoryboardSegue) {
       guard
            let controller = sender.source as? AllCommunitiesViewController,
            let indexPath = controller.tableView.indexPathForSelectedRow
       else {return}
        
        let selectedCommunity  = controller.allCommunity[indexPath.row]
        
       // if !community.contains(selectedCommunity) {
       if !allCommunity.contains(selectedCommunity) {
        
        allCommunity.append(selectedCommunity)
        tableView.reloadData()
                
           }

        
        }
        
      
        
    
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allCommunity.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "communityCell", for: indexPath) as! AllCommunityCell
        
        let communities = allCommunity[indexPath.item]
        
        cell.allCommunityCell?.text = communities.nameOfCommunity
       
        if let image = communities.imageofCommunity {
            cell.picOfCommunity.image = UIImage(named: image)
        } else {
            cell.picOfCommunity.image = UIImage(systemName: "person")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            allCommunity.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
  

}
