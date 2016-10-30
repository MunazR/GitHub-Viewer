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
    @IBOutlet weak var userBio: UILabel!
    
    @IBOutlet weak var userPublicRepos: UIButton!
    @IBOutlet weak var userFollowers: UIButton!
    @IBOutlet weak var userFollowing: UIButton!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (username == nil || (username?.isEmpty)!) {
            print("UserViewController: Username empty")
            return
        } else {
            print("UserViewController: " + username!)
        }
        
        stackView.isHidden = true
        activityIndicator.isHidden = false
                
        HttpStack.getUser(username: username!).responseJSON { response in
            if let result = response.result.value {
                let JSON = result as! NSDictionary
                let message = JSON.object(forKey: "message") as? String
                
                if message != nil {
                    print("Invalid response: \(message!)")
                    return
                }
                
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
                
                if user.bio != nil {
                    self.userBio.text = user.bio!
                } else {
                    self.userBio.text = "No bio"
                }
                
                self.userPublicRepos.setTitle("\(user.publicRepos!) Public Repos", for: UIControlState.normal)
                
                self.userFollowers.setTitle("\(user.followers!) Followers", for: UIControlState.normal)
                
                self.userFollowing.setTitle("\(user.following!) Following", for: UIControlState.normal)
                
                self.activityIndicator.isHidden = true
                self.stackView.isHidden = false
            }
        }
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let repoTableViewController = segue.destination as! RepoTableViewController
        repoTableViewController.username = username!

        if segue.identifier == "showPublicRepos" {
            repoTableViewController.listType = RepoTableViewController.ListType.publicRepos
        }
        
        if segue.identifier == "showStarredRepos" {
            repoTableViewController.listType = RepoTableViewController.ListType.starredRepos
        }
        
        if segue.identifier == "showSubscribedRepos" {
            repoTableViewController.listType = RepoTableViewController.ListType.subscribedRepos
        }
    }
    
}
