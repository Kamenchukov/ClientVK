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
    
    
    var allCommunity = [
                        CommunitiesOfUser(nameOfCommunity: "кинопоиск", imageofCommunity: "KinoPoisk"),
                        CommunitiesOfUser(nameOfCommunity: "BadNotDead", imageofCommunity: "bad")
    ]
    var vkServices = VKServices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
        vkServices.searchCommunities()
    }
    
    var filteredCommunity: [CommunitiesOfUser] = []
    var sections: [String] = []
    var cachedSectionItems: [String: [CommunitiesOfUser]] = [:]
    
    private func loadCommunities() {
        allCommunity = allCommunity.sorted(by: {
            $0.nameOfCommunity.lowercased() < $1.nameOfCommunity.lowercased()
        })
    }
    private func filterCommunities(text: String?) {
        guard  let text = text, !text.isEmpty else {
            filteredCommunity = allCommunity
            return
        }
        filteredCommunity = allCommunity.filter {
            $0.nameOfCommunity.lowercased().contains(text.lowercased())
        }
    }
    
    private func setupDataSource() {
       
       
        // 1 filter friends
        filterCommunities(text: searchBar.text)
        
        // 2 create sections of first letters
        let firstLetters = filteredCommunity.map{
            String($0.nameOfCommunity.uppercased().prefix(1))
            
        }
        sections = Array(Set(firstLetters)).sorted()
        
        // 3 create cached items for sections
        cachedSectionItems = [:]
        for section in sections {
            cachedSectionItems[section] = filteredCommunity.filter {
                $0.nameOfCommunity.uppercased().prefix(1) == section
            }
            
        }
        
        
    }
    
    private func getCommunity(for indexPath: IndexPath) -> CommunitiesOfUser {
        let sectionLetter = sections[indexPath.section]
        return cachedSectionItems[sectionLetter]![indexPath.row]
    }


    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    func numberOfSection(in tableView: UITableView) -> Int {
       return sections.count
   }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let sectionLetter = sections[section]
        return (cachedSectionItems[sectionLetter] ?? []).count
    }
    

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let lable = UILabel()
        lable.textColor = .gray
        lable.text = sections[section]
        lable.font = .systemFont(ofSize: 24, weight: .bold)
        return lable
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "allCommunityCell", for: indexPath) as! AllCommunityCell
        
        let communities = getCommunity(for: indexPath)
        
        cell.allCommunityCell.text = communities.nameOfCommunity
        
        if let image = communities.imageofCommunity {
            cell.picOfCommunity.image = UIImage(named: image)
        } else {
            cell.picOfCommunity.image = UIImage(systemName: "person")
        }
        return cell
    }
    //MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        setupDataSource()
        let text = searchText != "" ? searchText : ""
        vkServices.searchCommunities(stroke: text)
        tableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
    
}
    
