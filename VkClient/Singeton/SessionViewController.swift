//
//  SessionViewController.swift
//  VkClient
//
//  Created by Константин Каменчуков on 09.04.2021.
//

import UIKit


final class Session {
    static let shared = Session()
    
    private init() {}
    
    var token: String? = nil
    var userId: Int? = nil
}

//Singelton with two properties
class SessionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   
}
