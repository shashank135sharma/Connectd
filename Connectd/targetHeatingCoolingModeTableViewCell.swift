//
//  targetHeatingCoolingModeTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/12/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class targetHeatingCoolingModeTableViewCell: UITableViewCell {
    
    let homeManager = HomeManager.sharedInstance

    @IBOutlet weak var mainLabel: UILabel!
    var characteristic: HMCharacteristic?

    @IBOutlet weak var modeOutlet: UISegmentedControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(characteristic: HMCharacteristic) {
        if(characteristic.characteristicType == HMCharacteristicTypeCurrentHeatingCooling) {
            homeManager.currentMode = characteristic
            mainLabel.text = "Current Heating/Cooling Mode"
            modeOutlet.userInteractionEnabled = false
        }
        else {
            homeManager.targetMode = characteristic
        }
        
        if(homeManager.currentMode?.value is Int) {
            modeOutlet.selectedSegmentIndex = homeManager.currentMode!.value as! Int
        }
        else {
            println("target mode outlet is not of type int")
        }
    }

    @IBAction func modeAction(sender: UISegmentedControl) {
        homeManager.targetMode!.writeValue(sender.selectedSegmentIndex, completionHandler: { (error) -> Void in
            println("target mode error: \(error)")
        })
    }
    
}
