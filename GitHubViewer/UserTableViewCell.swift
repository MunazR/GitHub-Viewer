//
//  UserTableViewCell.swift
//  GitHubViewer
//
//  Created by Rahman, Munaz on 2016-11-03.
//  Copyright © 2016 Rahman, Munaz. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
