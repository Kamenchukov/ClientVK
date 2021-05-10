//
//  UserPhoto.swift
//  VkClient
//
//  Created by Константин Каменчуков on 27.04.2021.
//

import Foundation
import RealmSwift

class UserPhotos: Decodable {
     let response: UserPhotosResponse
 }

 class UserPhotosResponse: Decodable {
     let count: Int
     let items: [UserPhoto]
 }

 class UserPhoto: Object, Decodable {
    @objc dynamic var albumId: Int = 0
    @objc dynamic var date: Date = Date()
    @objc dynamic var hasTags: Bool = false
    @objc dynamic var height: String?
    @objc dynamic var id: Int = 0
    @objc dynamic var ownerId: Int = 0
    @objc dynamic var photo130: String?
    @objc dynamic var photo604: String?
    @objc dynamic var photo75: String?
    @objc dynamic var photo807: String?
    @objc dynamic var photo1280: String?
    @objc dynamic var photo2560: String?
    @objc dynamic var text: String = ""
    @objc dynamic var width: String?
    @objc dynamic var likes: PhotoLikes?
    @objc dynamic var reposts: PhotoReposts?
    
    override static func primaryKey() -> String? {
        return "id"
    }
 }

 class PhotoLikes: Object, Codable {
    @objc dynamic var userLikes: Int = 0
    @objc dynamic var count: Int = 0
 }

 class PhotoReposts: Object, Codable {
    @objc dynamic var count: Int = 0
 }
