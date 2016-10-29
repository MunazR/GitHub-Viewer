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
    
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userCompany: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userBlog: UILabel!
    @IBOutlet weak var userJoined: UILabel!
    @IBOutlet weak var userUpdated: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userAvatar.layer.borderWidth = 2
        
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
                
                self.navigationItem.title = user.login
                
                if user.avatarUrl != nil {
                    HttpStack.getImage(imageUrl: user.avatarUrl!).responseImage { response in
                        if let image = response.result.value {
                            self.userAvatar.image = image
                        }
                    }
                }
                
                if user.name != nil {
                    self.userName.text = user.name!
                } else {
                    self.userName.text = "No name"
                }
                
                if user.company != nil {
                    self.userCompany.text = user.company!
                } else {
                    self.userCompany.text = "No company"
                }
                
                if user.location != nil {
                    self.userLocation.text = user.location!
                } else {
                    self.userLocation.text = "No location"
                }
                
                if user.email !=  nil {
                    self.userEmail.text = user.email!
                } else {
                    self.userEmail.text = "No email"
                }
                
                if user.blog != nil {
                    self.userBlog.text = user.blog!
                } else {
                    self.userBlog.text = "No blog"
                }
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = DateFormatter.Style.medium
                
                self.userJoined.text = "Joined " + dateFormatter.string(from: user.createdAt!)
                self.userUpdated.text = "Last active " + dateFormatter.string(from: user.updatedAt!)
            }
        }
    }
    
}
