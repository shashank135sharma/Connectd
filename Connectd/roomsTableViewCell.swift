//
//  roomsTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/3/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class roomsTableViewCell: UITableViewCell {

    let homeManager = HomeManager.sharedInstance
    
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var numAccessoriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setUpCell(homeIndex: Int, roomIndex: Int) {
        var room = homeManager.homes[homeIndex].rooms?[roomIndex] as! HMRoom
        roomNameLabel.text = "\(room.name)"
    }
}
