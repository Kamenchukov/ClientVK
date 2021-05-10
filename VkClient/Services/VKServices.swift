//
//  VKServices.swift
//  VkClient
//
//  Created by Константин Каменчуков on 26.04.2021.
//

import Foundation
import Alamofire
import WebKit
import RealmSwift

open class VKServices {
     let baseURL = "https://api.vk.com/method/"
     let clientId = "7828380"
     let version = "5.68"

    func loadFriends(completion: @escaping ([User]) -> Void) {
         let path = "friends.get"

         let parameters: Parameters = [
             "user_id": Session.shared.userId ?? "0",
             "access_token": Session.shared.token ?? "0",
             "v": version,
             "fields": "photo_100"
         ]

         let url = baseURL + path

         AF.request(url, method: .get, parameters: parameters).responseData {
             response in
            guard let data = response.value else { return }
                             do {
                                 let decoder = JSONDecoder()
                                 decoder.keyDecodingStrategy = .convertFromSnakeCase
                                 let users = try decoder.decode(Friends.self, from: data)
                                 completion(users.response.items)
                             } catch {
                                 print(error)
                             }
                         }
             }
    func saveFriendsData(_ friends: [User]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(friends)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    func saveCommunitiesData(_ groups: [Group]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(groups)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }

     func loadCommunities(completion: @escaping ([Group]) -> Void) {
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
            guard let data = response.value else { return }
                         do {
                             let decoder = JSONDecoder()
                             decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let groups = try decoder.decode(Groups.self, from: data as! Data)
                             completion(groups.response.items)
                         } catch {
                             print(error)
                         }

         }
     }

     func searchCommunities(stroke: String = " ", completion: @escaping ([Group]) -> Void) {
         let path = "groups.search"

         let parameters: Parameters = [
             "access_token": Session.shared.token ?? "0",
             "v": version,
             "q": stroke
         ]

         let url = baseURL + path

         AF.request(url, method: .get, parameters: parameters).responseData {
             response in
            guard let data = response.value else { return }
                         do {
                             let decoder = JSONDecoder()
                             decoder.keyDecodingStrategy = .convertFromSnakeCase
                             let groups = try decoder.decode(Groups.self, from: data)
                             completion(groups.response.items)
                         } catch {
                             print(error)
                    }
         }
     }

    func loadPhotos(friendId: Int = Session.shared.userId, completion: @escaping ([UserPhoto]) -> Void) {
         let path = "photos.getAll"

         let parameters: Parameters = [
                "owner_id": friendId,
                "access_token": Session.shared.token ?? "0",
                "v": version,
                "no_service_albums": 0,
                "count": 50,
                "extended": 1
         ]
          let url = baseURL + path

         AF.request(url, method: .get, parameters: parameters).responseData {
             response in
            guard let data = response.value else { return }
                         do {
                             let decoder = JSONDecoder()
                             decoder.keyDecodingStrategy = .convertFromSnakeCase
                             let photos = try decoder.decode(UserPhotos.self, from: data)
                             completion(photos.response.items)
                         } catch {
                             print(error)
                         }
         }
     }
    func savePhotosData(_ photos:[UserPhoto]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(photos)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
