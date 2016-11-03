//
//  ActivityTableViewController.swift
//  GitHubViewer
//
//  Created by Rahman, Munaz on 2016-11-03.
//  Copyright © 2016 Rahman, Munaz. All rights reserved.
//

import UIKit

class ActivityTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var username: String?
    var activities = [Activity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (username == nil || (username?.isEmpty)!) {
            print("ActivityTableViewController: Username empty")
            return
        } else {
            print("ActivityTableViewController: " + username!)
        }
        
        self.navigationItem.title = username! + "'s Activity"
        
        HttpClient.getActivity(username: username!).responseJSON { response in
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
                
                self.parseActivities(JSONArray: JSONArray)
                
                self.tableView.reloadData()
            }
        }
    }
    
    func parseActivities(JSONArray: NSArray) {
        for activityJSON in JSONArray as! [NSDictionary] {
            let activity = Activity(JSON: activityJSON)
            
            activities += [activity]
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ActivityTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ActivityTableViewCell
        
        let activity = activities[(indexPath as NSIndexPath).row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.full
        
        cell.createdAt.text = dateFormatter.string(from: activity.createdAt!)
        
        if (activity.type! == "PushEvent")  {
            cell.event.text = "Pushed to " + activity.repo!.name!
        } else if (activity.type! == "WatchEvent") {
            cell.event.text = "Started watching " + activity.repo!.name!
        } else if (activity.type! == "CreateEvent") {
            cell.event.text = "Created " + activity.repo!.name!
        } else if (activity.type! == "ForkEvent") {
            cell.event.text = "Forked " + activity.repo!.name!
        } else {
            print("Unknown event type : " + activity.type!)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }

}
