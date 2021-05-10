//
//  CommunitiesViewController.swift
//  VkClient
//
//  Created by Константин Каменчуков on 03.03.2021.
//

import UIKit
import RealmSwift

class CommunitiesViewController: UITableViewController {
   // @IBOutlet weak var communityName: UILabel!
    
    //var allCommunity: [CommunitiesOfUser] = []
    var vkServices = VKServices()
    var myGroups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vkServices.loadCommunities() {[weak self] in
            self?.loadData()
            self?.tableView.reloadData()
        }
        
    }
    //MARK: - Seques
    @IBAction func unwindFromAllCommunities(_ sender: UIStoryboardSegue) {
       guard
            let controller = sender.source as? AllCommunitiesViewController,
            let indexPath = controller.tableView.indexPathForSelectedRow
       else {return}
        vkServices.loadCommunities() {[weak self] in
            self?.loadData()
            self?.tableView.reloadData()
        }
        //let selectedCommunity  = controller.allCommunity[indexPath.row]
        
   
//       if !myGroups.contains(selectedCommunity) {
//
//        myGroups.append(selectedCommunity)
//        tableView.reloadData()
                
           }

        
        
        
      
        
    
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "communityCell", for: indexPath) as! AllCommunityCell
        cell.allCommunityCell.text = myGroups[indexPath.item].name
        //cell.picOfCommunity.image = myGroups[indexPath.item].photo100
       
//        if let image = communities.imageofCommunity {
//            cell.picOfCommunity.image = UIImage(named: image)
//        } else {
//            cell.picOfCommunity.image = UIImage(systemName: "person")
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
  


}

extension CommunitiesViewController {
    func loadData() {
        do {
            let realm = try Realm()
            let groups = realm.objects(Group.self)
            self.myGroups = Array(groups)
        } catch {
            print(error)
        }
    }
}
