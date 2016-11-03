//
//  RepoTableViewController.swift
//  GitHubViewer
//
//  Created by Rahman, Munaz on 2016-10-29.
//  Copyright © 2016 Rahman, Munaz. All rights reserved.
//

import UIKit
import Alamofire

class RepoTableViewController: UITableViewController {
    
    public enum ListType {
        case publicRepos
        case subscribedRepos
        case starredRepos
    }
    
    var username: String?
    var listType: ListType?
    var repos = [Repo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (username == nil || (username?.isEmpty)!) {
            print("RepoTableViewController: Username empty")
            return
        } else {
            print("RepoTableViewController: " + username!)
        }
        
        if listType == ListType.publicRepos {
            self.navigationItem.title = "\(username!)'s Public Repos"
            loadPublicRepos()
        }
        
        if listType == ListType.starredRepos {
            self.navigationItem.title = "\(username!)'s Starred Repos"
            loadStarredRepos()
        }
        
        if listType == ListType.subscribedRepos {
            self.navigationItem.title = "\(username!)'s Subscribed Repos"
            loadSubscribedRepos()
        }
    }
    
    func loadPublicRepos() {
        let dataRequest = HttpClient.getPublicRepos(username: username!)
        handleResponse(dataRequest: dataRequest)
    }
    
    func loadStarredRepos() {
        let dataRequest = HttpClient.getStarredRepos(username: username!)
        handleResponse(dataRequest: dataRequest)
    }
    
    func loadSubscribedRepos() {
        let dataRequest = HttpClient.getSubscribedRepos(username: username!)
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
                                
                self.parseRepos(JSONArray: JSONArray)
                
                self.tableView.reloadData()
            }
        }
    }
    
    func parseRepos(JSONArray: NSArray) {
        for repoJSON in JSONArray as! [NSDictionary] {
            let repo = Repo(JSON: repoJSON)
            
            repos += [repo]
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RepoTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RepoTableViewCell
        
        let repo = repos[(indexPath as NSIndexPath).row]
        
        cell.repoName.text = repo.name!
        
        if repo.language != nil {
            cell.repoLanguage.text = repo.language!
        } else {
            cell.repoLanguage.text = "Unknown language"
        }
        
        cell.stargazers.text = "\(repo.stargazersCount!) stargazers"
        
        if repo.description != nil {
            cell.repoDescription.text = repo.description!
        } else {
            cell.repoDescription.text = "No description"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
