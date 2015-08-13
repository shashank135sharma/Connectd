//
//  powerStateTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/12/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class powerStateTableViewCell: UITableViewCell {

    @IBOutlet weak var onOrOffSegmentedControl: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpCell( ) {
    }

}
