//
//  currentDoorLockStateTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/12/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class currentDoorLockStateTableViewCell: UITableViewCell {

    @IBOutlet weak var changeLockOutlet: UIButton!
    @IBOutlet weak var lockLabel: UILabel!
    @IBOutlet weak var lockImage: UIImageView!
    var characteristic: HMCharacteristic?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUpCell(characteristic: HMCharacteristic) {
        self.characteristic = characteristic
    }
    
    @IBAction func changeLockAction(sender: AnyObject) {
    }
    
}
