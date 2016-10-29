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

class HttpStack {
    static let BASE_URL = "https://api.github.com/"
    static let USER_URL = BASE_URL + "users/"
    
    static func getUser(username: String) -> Alamofire.DataRequest {
        return Alamofire.request(USER_URL + username)
    }
    
    static func getImage(imageUrl: String) -> Alamofire.DataRequest {
        return Alamofire.request(imageUrl)
    }
}
