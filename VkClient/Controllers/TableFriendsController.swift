//
//  TableFriendsController.swift
//  VkClient
//
//  Created by Константин Каменчуков on 03.03.2021.
//

import UIKit
import RealmSwift

class TableFriendsController: UITableViewController, UISearchBarDelegate {
       // @IBOutlet weak var tableView: UITableView!
        @IBOutlet weak var searchBar: UISearchBar!

    var vkServices = VKServices()
    var users = [User]()
    var firstSymbols: [Character] = []
    var sortFriends: [Character: [User]] = [:]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //setupDataSource()
       // loadFriends()
        loadData()
        vkServices.loadFriends() {[weak self] in
            
            self?.loadData()
        
            
            self?.firstSymbols = (self?.createFirstSimbols())!
            self?.sortFriends = (self?.sortUsers())!
            self?.tableView.reloadData()
        }
    }
    // MARK: - Data source
//    var friends = [User(name: "Kate", image: "kate"),
//                   User(name: "Matt", image: "Matt"),
//                   User(name: "Andy", image: "andy"),
//                   User(name: "Zod")
//                   ]
    var filteredFriends: [User] = []
    var sections: [String] = []
    var cachedSectionItems: [String: [User]] = [:]
    
    
    
//    private func loadFriends() {
//        friends = friends.sorted(by: {
//            $0.name.lowercased() < $1.name.lowercased()
//        })
//    }
//    private func filterFriends(text: String?) {
//        guard  let text = text, !text.isEmpty else {
//            filteredFriends = friends
//            return
//        }
//        filteredFriends = friends.filter {
//            $0.name.lowercased().contains(text.lowercased())
//        }
//    }
    
//    private func setupDataSource() {
//
//
//        // 1 filter friends
//        filterFriends(text: searchBar.text)
//
//        // 2 create sections of first letters
//        let firstLetters = filteredFriends.map{
//            String($0.name.uppercased().prefix(1))
//
//        }
//        sections = Array(Set(firstLetters)).sorted()
//
//        // 3 create cached items for sections
//        cachedSectionItems = [:]
//        for section in sections {
//            cachedSectionItems[section] = filteredFriends.filter {
//                $0.name.uppercased().prefix(1) == section
//            }
//
//        }
//
//
//    }
//
//    private func getFriend(for indexPath: IndexPath) -> User {
//        let sectionLetter = sections[indexPath.section]
//        return cachedSectionItems[sectionLetter]![indexPath.row]
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortFriends.count > 0 ? sortFriends.count : 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let sectionLetter = sections[section]
//        return (cachedSectionItems[sectionLetter] ?? []).count
        return firstSymbols.count > 0 ? sortFriends[firstSymbols[section]]!.count : 0

    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return firstSymbols.count > 0 ? String(firstSymbols[section]) : ""
         }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let lable = UILabel()
//        lable.textColor = .gray
//        lable.text = sections[section]
//        lable.font = .systemFont(ofSize: 24, weight: .bold)
//        return lable
//    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendsViewCell
        
        let friend = sortFriends[firstSymbols[indexPath.section]]?[indexPath.item]
       
        cell.friendCell?.text = friend?.name
        
//        if let image = friend.image {
//            cell.friendFoto.image = UIImage(named: image)
//        } else {
//            cell.friendFoto.image = UIImage(systemName: "person")
//        }
        if let photo = friend?.photo100 {
            //cell.friendFoto.image = photo
        }
            
        return cell
    }
    
    //MARK: - UISearchBarDelegate
    
   
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        setupDataSource()
//        tableView.reloadData()
//    }
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//    }
}

    
extension TableFriendsController {
    
    private func createFirstSimbols() -> [Character] {
    var setSimbols: Set<Character> = []
    users.forEach({user in
        setSimbols.insert(user.name.first ?? " ")
    })
        
        return Array(setSimbols).sorted(by: {simbol, nextSimbol in return simbol < nextSimbol})
}
    private func sortUsers() -> [Character: [User]] {
        var newUsers: [Character: [User]] = [:]
        
        firstSymbols.forEach({ simbol in
            newUsers[simbol] = users.filter({user in
                return user.name.first == simbol
            })
        })
        
        return newUsers
    }
}

   //MARK: RealmData
    
    extension TableFriendsController {
       
        func loadData() {
            do {
                let realm = try Realm()
                let users = realm.objects(User.self)
                self.users = Array(users)
            } catch {
                print(error)
            }
        }
    }

