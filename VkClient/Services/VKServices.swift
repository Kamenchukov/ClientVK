//
//  VKServices.swift
//  VkClient
//
//  Created by Константин Каменчуков on 26.04.2021.
//

import Foundation
import Alamofire

open class VKServices {
     let baseURL = "https://api.vk.com/method/"
     let clientId = "7828380"
     let version = "5.68"

     func loadFriends() {
         let path = "friends.get"

         let parameters: Parameters = [
             "user_id": Session.shared.userId ?? "0",
             "access_token": Session.shared.token ?? "0",
             "v": version,
             "fields": "photo_100"
         ]

         let url = baseURL + path

         AF.request(url, method: .get, parameters: parameters).responseJSON {
             response in
                 print(response.value!)
             }
     }

     func loadCommunities() {
         let path = "groups.get"

         let parameters: Parameters = [
             "user_id": Session.shared.userId ?? "0",
             "access_token": Session.shared.token ?? "0",
             "v": version,
             "extended": "1"
         ]

         let url = baseURL + path

         AF.request(url, method: .get, parameters: parameters).responseJSON {
             response in
             print(response.value!)
         }
     }

     func searchCommunities(stroke: String = " ") {
         let path = "groups.search"

         let parameters: Parameters = [
             "access_token": Session.shared.token ?? "0",
             "v": version,
             "q": stroke
         ]

         let url = baseURL + path

         AF.request(url, method: .get, parameters: parameters).responseJSON {
             response in
             print(response.value!)
         }
     }

    func loadPhotos(friendId: String = String(Session.shared.userId)) {
         let path = "photos.getAll"

         let parameters: Parameters = [
             "owner_id": friendId,
             "access_token": Session.shared.token ?? "0",
             "v": version,
             "no_service_albums": 1
         ]
          let url = baseURL + path

         AF.request(url, method: .get, parameters: parameters).responseJSON {
             response in
             print(response.value!)
         }
     }
 }
