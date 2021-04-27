//
//  Communities.swift
//  VkClient
//
//  Created by Константин Каменчуков on 03.03.2021.
//

import Foundation

struct CommunitiesOfUser : Equatable {
    var nameOfCommunity: String
    var imageofCommunity: String?
}
extension CommunitiesOfUser {
    static var fakeCommunities: [CommunitiesOfUser] {
        return [
        CommunitiesOfUser(nameOfCommunity: "Cats and Dogs", imageofCommunity: "person")
        ]
    }
}
