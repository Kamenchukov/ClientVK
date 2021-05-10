//
//  AllCommunitiesViewController.swift
//  VkClient
//
//  Created by Константин Каменчуков on 03.03.2021.
//

import UIKit

class AllCommunitiesViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var allCommunityName: UILabel!
    
    
//    var allCommunity = [
//                        CommunitiesOfUser(nameOfCommunity: "кинопоиск", imageofCommunity: "KinoPoisk"),
//                        CommunitiesOfUser(nameOfCommunity: "BadNotDead", imageofCommunity: "bad")
//    ]
    var allGroups = [Group]()
    var vkServices = VKServices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupDataSource()
        vkServices.searchCommunities() {
            [weak self] groups in
            self?.allGroups = groups
            self?.tableView.reloadData()
        }
    }
    



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

//    func numberOfSection(in tableView: UITableView) -> Int {
//       return allGroups.count
//   }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return allGroups.count
    }
    

//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let lable = UILabel()
//        lable.textColor = .gray
//        lable.text = sections[section]
//        lable.font = .systemFont(ofSize: 24, weight: .bold)
//        return lable
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "allCommunityCell", for: indexPath) as! AllCommunityCell
        
//        let communities = getCommunity(for: indexPath)
//
//        cell.allCommunityCell.text = communities.nameOfCommunity
//
//        if let image = communities.imageofCommunity {
//            cell.picOfCommunity.image = UIImage(named: image)
//        } else {
//            cell.picOfCommunity.image = UIImage(systemName: "person")
//        }
        cell.textLabel?.text = allGroups[indexPath.item].name
        //cell.picOfCommunity.image = allGroups[indexPath.row].photo100
        //let photoUrl = URL(string: allGroups[indexPath.item].photo100 ?? "")
        
        return cell
    }
    //MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        let text = searchText != "" ? searchText : ""
        vkServices.searchCommunities(stroke: text) {[weak self] groups in
            self?.allGroups = groups
            self?.tableView.reloadData()
        }
       
    }
   
    
    
    
}
    
