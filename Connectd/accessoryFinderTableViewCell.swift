//
//  accessoryFinderTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/3/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit

class accessoryFinderTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfAccessory: UILabel!
    
    @IBOutlet weak var accessoryDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpCell(name: String) {
        nameOfAccessory.text = name
    }
}
