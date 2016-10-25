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
            if let result = response.result.value {
                let JSON = result as! NSDictionary
                let user = User(JSON: JSON)
                
                print(user.blog!)
            }
        }
    }
    
}
