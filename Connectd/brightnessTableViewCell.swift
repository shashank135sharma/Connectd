//
//  brightnessTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/12/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class brightnessTableViewCell: UITableViewCell {

    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var brightnessLabel: UILabel!
    
    var characteristic: HMCharacteristic?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUpCell(characteristic: HMCharacteristic) {
        self.characteristic = characteristic
        if(characteristic.value is Int){
            sliderOutlet.value = characteristic.value as! Float
            brightnessLabel.text = "\(characteristic.value as! Float)"
        }
        else {
            println("brightness is not of type int")
        }
    }
    
    @IBAction func sliderAction(sender: UISlider) {
        characteristic?.writeValue(sender.value, completionHandler: { (error) -> Void in
            println("Power state error: \(error)")
        })
        brightnessLabel.text = "\(characteristic!.value as! Float)"
    }

}
