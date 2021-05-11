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
    var myGroups: Results<Group>?
    var vkServices = VKServices()
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vkServices.loadCommunities()
        realmObserve()
        
    }
    //MARK: - Seques
    @IBAction func unwindFromAllCommunities(_ segue: UIStoryboardSegue) {
        
        guard let allCommunitiesContainer = segue.source as? AllCommunitiesViewController,
                       let _ = allCommunitiesContainer.tableView.indexPathForSelectedRow
                 else { return }

                 vkServices.loadCommunities()
        
                
           }

        
        
        
      
        
    
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return myGroups?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "communityCell", for: indexPath) as! AllCommunityCell
        cell.allCommunityCell.text = myGroups?[indexPath.item].name

        
        
        return cell
    }
    
  


}

extension CommunitiesViewController {
//    func loadData() {
//        do {
//            let realm = try Realm()
//            let groups = realm.objects(Group.self)
//            self.myGroups = Array(groups)
//        } catch {
//            print(error)
//        }
//    }
    func realmObserve() {
             guard let realm = try? Realm() else { return }
             myGroups = realm.objects(Group.self)

             token = myGroups?.observe { [weak self] (changes: RealmCollectionChange) in
                 guard let self = self,
                       let tableView = self.tableView else { return }

                 switch changes {
                     case .initial:
                         tableView.reloadData()
                     case .update(_, let deletions, let insertions, let modifications):
                         tableView.beginUpdates()
                         tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                              with: .automatic)
                         tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                              with: .automatic)
                         tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                              with: .automatic)
                         tableView.endUpdates()
                     case .error(let error):
                         fatalError("\(error)")
                 }
             }
         }
}
