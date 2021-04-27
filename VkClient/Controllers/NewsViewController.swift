//
//  NewsViewController.swift
//  VkClient
//
//  Created by Константин Каменчуков on 28.03.2021.
//

import UIKit

class NewsViewController: UITableViewController {
    
    var news: [News] = [
        News(name: "Monika", letter: "What's happening in Alaska", bigPic: "alaska"),
        News(name: "Drake", pic: "drake", letter: "Your favorite song from last album Chicago Freestyle or Pain 1993?", bigPic: "drake logo")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "newsCell") //регистрация ячейки
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell

        let allNews = news[indexPath.row]
        let nameInNews = news[indexPath.row]
        
        cell.name.text = nameInNews.name
        cell.letter.text = allNews.letter
        
        if let image = allNews.pic {
            cell.pic.image = UIImage(named: image)
        } else {
            cell.pic.image = UIImage(systemName: "person")
        }
        
        if let image = allNews.bigPic {
            cell.bigPic.image = UIImage(named: image)
        } else {
            cell.bigPic.image = UIImage(systemName:  "person")
        }
        return cell
    }


}
