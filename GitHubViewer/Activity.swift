//
//  Activity.swift
//  GitHubViewer
//
//  Created by Rahman, Munaz on 2016-11-03.
//  Copyright © 2016 Rahman, Munaz. All rights reserved.
//

import Foundation

class Activity {
    
    var id: String?
    var type: String?
    var actor: User?
    var repo: Repo?
    var isPublic: Bool?
    var createdAt: Date?
    
    init(JSON: NSDictionary) {
        id = JSON.object(forKey: "id") as? String
        type = JSON.object(forKey: "type") as? String
        actor = User(JSON: JSON.object(forKey: "actor") as! NSDictionary)
        repo = Repo(JSON: JSON.object(forKey: "repo") as! NSDictionary)
        isPublic = JSON.object(forKey: "public") as? Bool

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        
        let strCreatedAt = JSON.object(forKey: "created_at") as? String
        
        if strCreatedAt != nil {
            createdAt = dateFormatter.date(from: strCreatedAt!)
        }
    }
}
