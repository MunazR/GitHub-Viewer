//
//  User.swift
//  GitHubViewer
//
//  Created by Rahman, Munaz on 2016-10-24.
//  Copyright © 2016 Rahman, Munaz. All rights reserved.
//

import Foundation

class User {
    
    // MARK: Properties
    
    var login: String?
    var id: Int?
    var avatarUrl: String?
    var gravatorId: String?
    var url: String?
    var htmlUrl: String?
    var followersUrl: String?
    var followingUrl: String?
    var gistsUrl: String?
    var starredUrl: String?
    var subscriptionsUrl: String?
    var organizationsUrl: String?
    var reposUrl: String?
    var eventsUrl: String?
    var receivedEventsUrl: String?
    var type: String?
    var siteAdmin: Bool?
    var name: String?
    var company: String?
    var blog: String?
    var location: String?
    var email: String?
    var hireable: Bool?
    var bio: String?
    var publicRepos: Int?
    var publicGists: Int?
    var followers: Int?
    var following: Int?
    var createdAt: Date?
    var updatedAt: Date?
        
    init(JSON: NSDictionary) {
        login = JSON.object(forKey: "login") as? String
        id = JSON.object(forKey: "id") as? Int
        avatarUrl = JSON.object(forKey: "avatar_url") as? String
        gravatorId = JSON.object(forKey: "gravator_id") as? String
        url = JSON.object(forKey: "url") as? String
        htmlUrl = JSON.object(forKey: "html_url") as? String
        followersUrl = JSON.object(forKey: "followers_url") as? String
        followingUrl = JSON.object(forKey: "following_url") as? String
        gistsUrl = JSON.object(forKey: "gists_url") as? String
        starredUrl = JSON.object(forKey: "starred_url") as? String
        subscriptionsUrl = JSON.object(forKey: "subscriptions_url") as? String
        organizationsUrl = JSON.object(forKey: "organizations_url") as? String
        reposUrl = JSON.object(forKey: "repos_url") as? String
        eventsUrl = JSON.object(forKey: "events_url") as? String
        receivedEventsUrl = JSON.object(forKey: "received_events_url") as? String
        type = JSON.object(forKey: "type") as? String
        siteAdmin = JSON.object(forKey: "site_admin") as? Bool
        name = JSON.object(forKey: "name") as? String
        company = JSON.object(forKey: "company") as? String
        blog = JSON.object(forKey: "blog") as? String
        location = JSON.object(forKey: "location") as? String
        email = JSON.object(forKey: "email") as? String
        hireable = JSON.object(forKey: "hireable") as? Bool
        bio = JSON.object(forKey: "bio") as? String
        publicRepos = JSON.object(forKey: "public_repos") as? Int
        publicGists = JSON.object(forKey: "public_gists") as? Int
        followers = JSON.object(forKey: "followers") as? Int
        following = JSON.object(forKey: "following") as? Int
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        
        createdAt = dateFormatter.date(from: JSON.object(forKey: "created_at") as! String)
        updatedAt = dateFormatter.date(from: JSON.object(forKey: "updated_at") as! String)
    }
    
    
}
