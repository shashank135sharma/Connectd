//
//  homesTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/3/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit

class homesTableViewCell: UITableViewCell {

    @IBOutlet weak var homeNameLabel: UILabel!
    @IBOutlet weak var numberOfRoomsLabel: UILabel!
    @IBOutlet weak var numberOfAccessoriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setUpCell(homeName: String, numberOfRooms: Int, numberOfAccessories: Int) {
        homeNameLabel.text = homeName
        numberOfRoomsLabel.text = "Number of rooms: \(numberOfRooms)"
        //numberOfAccessoriesLabel.text = "Number of accessoirs: \(numberOfAccessories)"
        numberOfAccessoriesLabel.text = "Number of accessories: \(numberOfAccessories)"

    }
}