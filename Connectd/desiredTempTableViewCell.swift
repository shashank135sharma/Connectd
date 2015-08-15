//
//  desiredTempTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/12/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class desiredTempTableViewCell: UITableViewCell {

    @IBOutlet weak var tempLabel: UILabel!
    var characteristic: HMCharacteristic?
    
    @IBOutlet weak var sliderOutlet: UISlider!
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
        
        if(characteristic.value is Float){
            var value = characteristic.value as! Float
            value = value*9
            value = value/5
            value = value+32
            sliderOutlet.value = value
        }
        else {
            println("desired temp is not of type float")
        }
    }
    
    @IBAction func sliderAction(sender: UISlider) {
        var value = sender.value
        value = value*9
        value = value/5
        value = value+32
        tempLabel.text = "\(ceil(value))"
        characteristic?.writeValue(sender.value, completionHandler: { (error) -> Void in
            println("Error in desired temps: \(error)")
        })
    }

}
