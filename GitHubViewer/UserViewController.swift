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
    
    // MARK: Properties
    
    var username: String?
    var user: User?
    
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
        
        username = username?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
                
        HttpClient.getUser(username: username!).responseJSON { response in
            if let result = response.result.value {
                let JSON = result as! NSDictionary
                let message = JSON.object(forKey: "message") as? String
                
                if message != nil {
                    print("Invalid response: \(message!)")
                    
                    let alert = UIAlertController(title: "Not found", message: "Could not find user: \(self.username!)", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: self.userNotFoundHandler))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                
                self.user = User(JSON: JSON)
                
                self.navigationItem.title = self.user!.login
                
                if self.user!.avatarUrl != nil {
                    HttpClient.getImage(imageUrl: self.user!.avatarUrl!).responseImage { response in
                        if let image = response.result.value {
                            self.userAvatar.image = image
                        }
                    }
                }
                
                if self.user!.name != nil {
                    self.userName.text = self.user!.name!
                } else {
                    self.userName.text = "No name"
                }
                
                if self.user!.company != nil {
                    self.userCompany.text = self.user!.company!
                } else {
                    self.userCompany.text = "No company"
                }
                
                if self.user!.location != nil {
                    self.userLocation.text = self.user!.location!
                } else {
                    self.userLocation.text = "No location"
                }
                
                if self.user!.email !=  nil {
                    self.userEmail.text = self.user!.email!
                } else {
                    self.userEmail.text = "No email"
                }
                
                if self.user!.blog != nil {
                    self.userBlog.text = self.user!.blog!
                } else {
                    self.userBlog.text = "No blog"
                }
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = DateFormatter.Style.medium
                
                self.userJoined.text = "Joined " + dateFormatter.string(from: self.user!.createdAt!)
                self.userUpdated.text = "Last active " + dateFormatter.string(from: self.user!.updatedAt!)
                
                if self.user!.bio != nil {
                    self.userBio.text = self.user!.bio!
                } else {
                    self.userBio.text = "No bio"
                }
                
                self.userPublicRepos.setTitle("\(self.user!.publicRepos!) Public Repos", for: UIControlState.normal)
                
                self.userFollowers.setTitle("\(self.user!.followers!) Followers", for: UIControlState.normal)
                
                self.userFollowing.setTitle("\(self.user!.following!) Following", for: UIControlState.normal)
                
                self.activityIndicator.isHidden = true
                self.stackView.isHidden = false
            }
        }
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPublicRepos" {
            let repoTableViewController = segue.destination as! RepoTableViewController
            repoTableViewController.username = self.user!.login
            repoTableViewController.listType = RepoTableViewController.ListType.publicRepos
        }
        
        if segue.identifier == "showStarredRepos" {
            let repoTableViewController = segue.destination as! RepoTableViewController
            repoTableViewController.username = self.user!.login
            repoTableViewController.listType = RepoTableViewController.ListType.starredRepos
        }
        
        if segue.identifier == "showSubscribedRepos" {
            let repoTableViewController = segue.destination as! RepoTableViewController
            repoTableViewController.username = self.user!.login
            repoTableViewController.listType = RepoTableViewController.ListType.subscribedRepos
        }
        
        if segue.identifier == "showFollowers" {
            let userTableViewController = segue.destination as! UserTableViewController
            userTableViewController.username = self.user!.login
            userTableViewController.listType = UserTableViewController.ListType.followers
        }
        
        if segue.identifier == "showFollowing" {
            let userTableViewController = segue.destination as! UserTableViewController
            userTableViewController.username = self.user!.login
            userTableViewController.listType = UserTableViewController.ListType.following
        }
        
        if segue.identifier == "showActivity" {
            let activityTableViewController = segue.destination as! ActivityTableViewController
            activityTableViewController.username = self.user!.login
        }
    }
    
    func userNotFoundHandler(alert: UIAlertAction!) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
