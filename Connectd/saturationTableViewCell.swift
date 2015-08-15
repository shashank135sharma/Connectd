//
//  saturationTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/12/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class saturationTableViewCell: UITableViewCell {

    @IBOutlet weak var saturationLabel: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
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
        
        if(characteristic.value is Float) {
            sliderOutlet.value = characteristic.value as! Float
            saturationLabel.text = "\(ceil(sliderOutlet.value))"
        }
        else {
            println("Saturation is not of type float")
        }
    }
    
    @IBAction func sliderAction(sender: UISlider) {
        saturationLabel.text = "\(ceil(sender.value))"
        
        characteristic?.writeValue(sender.value as Float, completionHandler: { (error) -> Void in
            println("Error saturation slider: \(error)")
        })
    }
}
