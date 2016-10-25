//
//  UserViewController.swift
//  GitHubViewer
//
//  Created by Rahman, Munaz on 2016-10-11.
//  Copyright © 2016 Rahman, Munaz. All rights reserved.
//

import UIKit
import Alamofire

class UserViewController: UIViewController {
    
    var username: String?
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (username?.isEmpty)! {
            print("UserViewController: Username empty")
            return
        } else {
            print("UserViewController: " + username!)
        }
                
        HttpStack.getUser(username: username!).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let result = response.result.value {
                let JSON = result as! NSDictionary
                print("JSON: \(JSON)")
                
                let name = JSON.object(forKey: "name");
                print("Name: \(name!)");
            }
        }
    }
    
}
