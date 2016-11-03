//
//  UserTableViewController.swift
//  GitHubViewer
//
//  Created by Rahman, Munaz on 2016-11-03.
//  Copyright © 2016 Rahman, Munaz. All rights reserved.
//

import UIKit
import Alamofire

class UserTableViewController: UITableViewController {

    public enum ListType {
        case followers
        case following
    }
    
    // MARK : Properties
    
    var username: String?
    var listType: ListType?
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (username == nil || (username?.isEmpty)!) {
            print("UserTableViewController: Username empty")
            return
        } else {
            print("UserTableViewController: " + username!)
        }
        
        if listType == ListType.followers {
            self.navigationItem.title = "\(username!)'s Followers"
            loadFollowers();
        }
        
        if listType == ListType.following {
            self.navigationItem.title = "\(username!)'s Following"
            loadFollowing()
        }
    }
    
    func loadFollowers() {
        let dataRequest = HttpClient.getFollowers(username: username!)
        handleResponse(dataRequest: dataRequest)
    }
    
    func loadFollowing() {
        let dataRequest = HttpClient.getFollowing(username: username!)
        handleResponse(dataRequest: dataRequest)
    }
    
    func handleResponse(dataRequest: DataRequest) {
        dataRequest.responseJSON { response in
            if let result = response.result.value {
                let JSON = result as? NSDictionary
                
                if JSON != nil {
                    let message = JSON!.object(forKey: "message") as? String
                    
                    if message != nil {
                        print("Invalid response: \(message!)")
                    }
                    
                    return;
                }
                
                let JSONArray = result as! NSArray
                
                self.parseUsers(JSONArray: JSONArray)
                
                self.tableView.reloadData()
            }
        }
    }
    
    func parseUsers(JSONArray: NSArray) {
        for userJSON in JSONArray as! [NSDictionary] {
            let user = User(JSON: userJSON)
            
            users += [user]
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "UserTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UserTableViewCell
        
        let user = users[(indexPath as NSIndexPath).row]
        
        cell.username.text = "  " + user.login!
        
        HttpClient.getImage(imageUrl: user.avatarUrl!).responseImage { response in
            if let image = response.result.value {
                cell.userAvatar.image = image
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let userViewController = segue.destination as! UserViewController
        let user = users[tableView.indexPathForSelectedRow!.row]
        
        userViewController.username = user.login
    }
}
