//
//  File.swift
//  VkClient
//
//  Created by Константин Каменчуков on 03.03.2021.
//

import Foundation

struct User {
    var name: String
    var image: String?
}
extension User {
    static var fake: [User] {
        return [
            User(name: "Kate", image: nil),
            User(name: "Matt", image: nil)
        ]
            
    }
}
