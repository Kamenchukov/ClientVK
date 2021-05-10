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
    
    var token: String = ""
    var userId: Int = 0
}

//Singelton with two properties
class SessionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   
}
