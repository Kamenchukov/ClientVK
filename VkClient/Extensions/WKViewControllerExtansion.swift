//
//  ViewControllerExtansion.swift
//  VkClient
//
//  Created by Константин Каменчуков on 17.04.2021.
//

import UIKit
import WebKit
import Foundation

extension ViewController: WKNavigationDelegate {
   
    func webView(_ webView: WKWebView, decidePolicyFor nagigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = nagigationResponse.response.url, url.path == "/blank.html",
              let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map {
                $0.components(separatedBy: "=")
            }
            .reduce([String: String]()) {
                result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        let token = params["access_token"]
        print(token)
//        Session.shared.token = params["access_token"]!
//        Session.shared.userId = Int(params["user_id"]!)!
        
        
        decisionHandler(.cancel)
    }
}
