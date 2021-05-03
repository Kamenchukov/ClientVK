//
//  WKViewController.swift
//  VkClient
//
//  Created by Константин Каменчуков on 13.04.2021.
//

import UIKit
import Alamofire
import WebKit

class WKViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView! {
            didSet{
                webView.navigationDelegate = self
            }
        }

        override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
    
    }
    func loadWebView() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7828380"),
            URLQueryItem(name: "dusplay", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token")
        ]
        
        
        
        let request = URLRequest(url: urlComponents.url!)
        webView.load(request)
        }


}
