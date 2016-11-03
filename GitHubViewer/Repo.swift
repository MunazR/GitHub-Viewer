//
//  Repo.swift
//  GitHubViewer
//
//  Created by Rahman, Munaz on 2016-10-29.
//  Copyright © 2016 Rahman, Munaz. All rights reserved.
//

import Foundation

class Repo {
 
    // MARK: Properties
    
    var id: Int?
    var name: String?
    var fullName: String?
    var owner: User?
    var isPrivate: Bool?
    var htmlUrl: String?
    var description: String?
    var fork: Bool?
    var url: String?
    var forksUrl: String?
    var keysUrl: String?
    var collaboratorsUrl: String?
    var teamsUrl: String?
    var hooksUrl: String?
    var issueEventsUrl: String?
    var eventsUrl: String?
    var assigneesUrl: String?
    var branchesUrl: String?
    var tagsUrl: String?
    var blobsUrl: String?
    var gitTagsUrl: String?
    var gitRefsUrl: String?
    var treesUrl: String?
    var statusesUrl: String?
    var languagesUrl: String?
    var stargazersUrl: String?
    var contributorsUrl: String?
    var subscribersUrl: String?
    var subscriptionUrl: String?
    var commitsUrl: String?
    var gitCommitsUrl: String?
    var commentsUrl: String?
    var issueCommentUrl: String?
    var contentsUrl: String?
    var compareUrl: String?
    var mergesUrl: String?
    var archiveUrl: String?
    var downloadsUrl: String?
    var issuesUrl: String?
    var pullsUrl: String?
    var milestonesUrl: String?
    var notificationsUrl: String?
    var labelsUrl: String?
    var releasesUrl: String?
    var deploymentsUrl: String?
    var createdAt: Date?
    var updatedAt: Date?
    var pushedAt: Date?
    var gitUrl: String?
    var sshUrl: String?
    var cloneUrl: String?
    var svnUrl: String?
    var homepage: String?
    var size: Int?
    var stargazersCount: Int?
    var watchersCount: Int?
    var language: String?
    var hasIssues: Bool?
    var hasDownloads: Bool?
    var hasWiki: Bool?
    var hasPages: Bool?
    var forksCount: Int?
    var mirrorUrl: String?
    var openIssuesCount: Int?
    var forks: Int?
    var openIssues: Int?
    var watchers: Int?
    var defaultBranch: String?
    
    init(JSON: NSDictionary) {
        id = JSON.object(forKey: "id") as? Int
        name = JSON.object(forKey: "name") as? String
        fullName = JSON.object(forKey: "full_name") as? String
        let ownerJSON = JSON.object(forKey: "owner") as? NSDictionary
        if ownerJSON != nil {
            owner = User(JSON: ownerJSON!)
        }
        isPrivate = JSON.object(forKey: "private") as? Bool
        htmlUrl = JSON.object(forKey: "html_url") as? String
        description = JSON.object(forKey: "description") as? String
        fork = JSON.object(forKey: "fork") as? Bool
        url = JSON.object(forKey: "url") as? String
        forksUrl = JSON.object(forKey: "forks_url") as? String
        keysUrl = JSON.object(forKey: "keys_url") as? String
        collaboratorsUrl = JSON.object(forKey: "collaborators_url") as? String
        teamsUrl = JSON.object(forKey: "teams_url") as? String
        hooksUrl = JSON.object(forKey: "hooks_url") as? String
        issueEventsUrl = JSON.object(forKey: "issue_events_url") as? String
        eventsUrl = JSON.object(forKey: "events_url") as? String
        assigneesUrl = JSON.object(forKey: "assignees_url") as? String
        branchesUrl = JSON.object(forKey: "branches_url") as? String
        tagsUrl = JSON.object(forKey: "tags_url") as? String
        blobsUrl = JSON.object(forKey: "blobs_url") as? String
        gitTagsUrl = JSON.object(forKey: "git_tags_url") as? String
        gitRefsUrl = JSON.object(forKey: "git_refs_url") as? String
        treesUrl = JSON.object(forKey: "trees_url") as? String
        statusesUrl = JSON.object(forKey: "status_url") as? String
        languagesUrl = JSON.object(forKey: "languages_url") as? String
        stargazersUrl = JSON.object(forKey: "stargazers_url") as? String
        contributorsUrl = JSON.object(forKey: "contributors_url") as? String
        subscribersUrl = JSON.object(forKey: "subscribers_url") as? String
        subscriptionUrl = JSON.object(forKey: "subscription_url") as? String
        commitsUrl = JSON.object(forKey: "commits_url") as? String
        gitCommitsUrl = JSON.object(forKey: "git_commits_url") as? String
        commentsUrl = JSON.object(forKey: "comments_url") as? String
        issueCommentUrl = JSON.object(forKey: "issue_comment_url") as? String
        contentsUrl = JSON.object(forKey: "contents_url") as? String
        compareUrl = JSON.object(forKey: "compare_url") as? String
        mergesUrl = JSON.object(forKey: "merges_url") as? String
        archiveUrl = JSON.object(forKey: "archive_url") as? String
        downloadsUrl = JSON.object(forKey: "downloads_url") as? String
        issuesUrl = JSON.object(forKey: "issues_url") as? String
        pullsUrl = JSON.object(forKey: "pulls_url") as? String
        milestonesUrl = JSON.object(forKey: "milestones_url") as? String
        notificationsUrl = JSON.object(forKey: "notifications_url") as? String
        labelsUrl = JSON.object(forKey: "labels_url") as? String
        releasesUrl = JSON.object(forKey: "release_url") as? String
        deploymentsUrl = JSON.object(forKey: "deployments_url") as? String
        gitUrl = JSON.object(forKey: "git_url") as? String
        sshUrl = JSON.object(forKey: "ssh_url") as? String
        cloneUrl = JSON.object(forKey: "clone_url") as? String
        svnUrl = JSON.object(forKey: "svn_url") as? String
        homepage = JSON.object(forKey: "homepage") as? String
        size = JSON.object(forKey: "size") as? Int
        stargazersCount = JSON.object(forKey: "stargazers_count") as? Int
        watchersCount = JSON.object(forKey: "watchers_count") as? Int
        language = JSON.object(forKey: "language") as? String
        hasIssues = JSON.object(forKey: "has_issues") as? Bool
        hasDownloads = JSON.object(forKey: "has_downloads") as? Bool
        hasWiki = JSON.object(forKey: "has_wiki") as? Bool
        hasPages = JSON.object(forKey: "has_pages") as? Bool
        forksCount = JSON.object(forKey: "forks_count") as? Int
        mirrorUrl = JSON.object(forKey: "mirrors_url") as? String
        openIssuesCount = JSON.object(forKey: "open_issues_count") as? Int
        forks = JSON.object(forKey: "forks") as? Int
        openIssuesCount = JSON.object(forKey: "open_issues") as? Int
        watchers = JSON.object(forKey: "watchers") as? Int
        defaultBranch = JSON.object(forKey: "default_branch") as? String
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        
        let strCreatedAt = JSON.object(forKey: "created_at") as? String
        
        if strCreatedAt != nil {
            createdAt = dateFormatter.date(from: strCreatedAt!)
        }
        
        let strUpdatedAt = JSON.object(forKey: "updated_at") as? String
        
        if strUpdatedAt != nil {
            updatedAt = dateFormatter.date(from: strUpdatedAt!)
        }
        
        let strPushedAt = JSON.object(forKey: "pushed_at") as? String
        
        if strPushedAt != nil {
            updatedAt = dateFormatter.date(from: strPushedAt!)
        }
        
    }
    
}
