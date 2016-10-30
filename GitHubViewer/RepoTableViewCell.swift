//
//  RepoTableViewCell.swift
//  GitHubViewer
//
//  Created by Rahman, Munaz on 2016-10-29.
//  Copyright © 2016 Rahman, Munaz. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoLanguage: UILabel!
    @IBOutlet weak var stargazers: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
