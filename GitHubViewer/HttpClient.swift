//
//  HttpStack.swift
//  GitHubViewer
//
//  Created by Rahman, Munaz on 2016-10-24.
//  Copyright © 2016 Rahman, Munaz. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class HttpClient {
    static let BASE_URL = "https://api.github.com/"
    static let USER_URL = BASE_URL + "users/%@"
    static let PUBLIC_REPOS_URL = BASE_URL + "users/%@/repos"
    static let STARRED_REPOS_URL = BASE_URL + "users/%@/starred"
    static let SUBSCRIPTIONS_REPOS_URL = BASE_URL + "users/%@/subscriptions"
    static let FOLLOWERS_URL = BASE_URL + "users/%@/followers"
    static let FOLLOWING_URL = BASE_URL + "users/%@/following"
    static let ACTIVITY_URL = BASE_URL + "users/%@/events"

    static func getUser(username: String) -> Alamofire.DataRequest {
        return Alamofire.request(String(format: USER_URL, username))
    }
    
    static func getPublicRepos(username: String) -> Alamofire.DataRequest {
        return Alamofire.request(String(format: PUBLIC_REPOS_URL, username))
    }
    
    static func getStarredRepos(username: String) -> Alamofire.DataRequest {
        return Alamofire.request(String(format: STARRED_REPOS_URL, username))
    }
    
    static func getSubscribedRepos(username: String) -> Alamofire.DataRequest {
        return Alamofire.request(String(format: SUBSCRIPTIONS_REPOS_URL, username))
    }
    
    static func getFollowers(username: String) -> Alamofire.DataRequest {
        return Alamofire.request(String(format: FOLLOWERS_URL, username))
    }
    
    static func getFollowing(username: String) -> Alamofire.DataRequest {
        return Alamofire.request(String(format: FOLLOWING_URL, username))
    }
    
    static func getActivity(username: String) -> Alamofire.DataRequest {
        return Alamofire.request(String(format: ACTIVITY_URL, username))
    }
    
    static func getImage(imageUrl: String) -> Alamofire.DataRequest {
        return Alamofire.request(imageUrl)
    }
}
