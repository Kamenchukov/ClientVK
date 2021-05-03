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
    
//    var filteredCommunity: [CommunitiesOfUser] = []
//    var sections: [String] = []
//    var cachedSectionItems: [String: [CommunitiesOfUser]] = [:]
    
//    private func loadCommunities() {
//        allCommunity = allCommunity.sorted(by: {
//            $0.nameOfCommunity.lowercased() < $1.nameOfCommunity.lowercased()
//        })
//    }
//    private func filterCommunities(text: String?) {
//        guard  let text = text, !text.isEmpty else {
//            filteredCommunity = allCommunity
//            return
//        }
//        filteredCommunity = allCommunity.filter {
//            $0.nameOfCommunity.lowercased().contains(text.lowercased())
//        }
//    }
    
//    private func setupDataSource() {
//
//
//        // 1 filter friends
//        filterCommunities(text: searchBar.text)
//
//        // 2 create sections of first letters
//        let firstLetters = filteredCommunity.map{
//            String($0.nameOfCommunity.uppercased().prefix(1))
//
//        }
//        sections = Array(Set(firstLetters)).sorted()
//
//        // 3 create cached items for sections
//        cachedSectionItems = [:]
//        for section in sections {
//            cachedSectionItems[section] = filteredCommunity.filter {
//                $0.nameOfCommunity.uppercased().prefix(1) == section
//            }
//
//        }
//
//
//    }
    
//    private func getCommunity(for indexPath: IndexPath) -> CommunitiesOfUser {
//        let sectionLetter = sections[indexPath.section]
//        return cachedSectionItems[sectionLetter]![indexPath.row]
//    }


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
    
