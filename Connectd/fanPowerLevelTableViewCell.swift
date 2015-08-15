//
//  fanPowerLevelTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/12/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class fanPowerLevelTableViewCell: UITableViewCell {

    @IBOutlet weak var fanLabel: UILabel!
    @IBOutlet weak var fanSlider: UISlider!
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
    @IBAction func fanLevelControl(sender: AnyObject) {
        
    }
}
