//
//  TableFriendsController.swift
//  VkClient
//
//  Created by Константин Каменчуков on 03.03.2021.
//

import UIKit

class TableFriendsController: UITableViewController, UISearchBarDelegate {
       // @IBOutlet weak var tableView: UITableView!
        @IBOutlet weak var searchBar: UISearchBar!


    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
        loadFriends()
        vkServices.loadFriends()
    }
    // MARK: - Data source
    var friends = [User(name: "Kate", image: "kate"),
                   User(name: "Matt", image: "Matt"),
                   User(name: "Andy", image: "andy"),
                   User(name: "Zod")
                   ]
    var filteredFriends: [User] = []
    var sections: [String] = []
    var cachedSectionItems: [String: [User]] = [:]
    var vkServices = VKServices()
    
    private func loadFriends() {
        friends = friends.sorted(by: {
            $0.name.lowercased() < $1.name.lowercased()
        })
    }
    private func filterFriends(text: String?) {
        guard  let text = text, !text.isEmpty else {
            filteredFriends = friends
            return
        }
        filteredFriends = friends.filter {
            $0.name.lowercased().contains(text.lowercased())
        }
    }
    
    private func setupDataSource() {
       
       
        // 1 filter friends
        filterFriends(text: searchBar.text)
        
        // 2 create sections of first letters
        let firstLetters = filteredFriends.map{
            String($0.name.uppercased().prefix(1))
            
        }
        sections = Array(Set(firstLetters)).sorted()
        
        // 3 create cached items for sections
        cachedSectionItems = [:]
        for section in sections {
            cachedSectionItems[section] = filteredFriends.filter {
                $0.name.uppercased().prefix(1) == section
            }
            
        }
        
        
    }
    
    private func getFriend(for indexPath: IndexPath) -> User {
        let sectionLetter = sections[indexPath.section]
        return cachedSectionItems[sectionLetter]![indexPath.row]
    }

    // MARK: - Table view data source

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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendsViewCell
        
        let friend = getFriend(for: indexPath)
       
        cell.friendCell?.text = friend.name
        
        if let image = friend.image {
            cell.friendFoto.image = UIImage(named: image)
        } else {
            cell.friendFoto.image = UIImage(systemName: "person")
        }
        return cell
    }
    
    //MARK: - UISearchBarDelegate
    
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        setupDataSource()
        tableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
    
    
  

   
