//
//  accessoryListTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/3/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class accessoryListTableViewCell: UITableViewCell {
    
    let homeManager = HomeManager.sharedInstance
    var currentAccessory: Int?
    var currentState: Bool?
    
    @IBOutlet weak var reachableLabel: UILabel!
    @IBOutlet weak var bulbImage: UIImageView!
    @IBOutlet weak var nameOfAccessories: UILabel!
    @IBOutlet weak var accessorySwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func getValue()-> Bool {
        var services: [HMService] = homeManager.primaryHome.accessories[currentAccessory!].services as! [HMService]
        for service in services {
            for characteristic in service.characteristics as! [HMCharacteristic] {
                if(characteristic.characteristicType == HMCharacteristicTypePowerState) {
                    if(characteristic.value != nil){
                        var value = characteristic.value as! Bool
                        return value
                    }
                    return true
                }
            }
        }
        return true
    }
    
    func setUpCell(name: String, reachable: Bool, accessoryInt: Int) {
        nameOfAccessories.text = name
        currentAccessory = accessoryInt
        if(getValue()) {
            bulbImage.image = UIImage(named: "accessory on")
            accessorySwitch.on = true
        }
        else {
            bulbImage.image = UIImage(named: "accessory off")
            accessorySwitch.on = false
        }
        if(reachable){
            reachableLabel.text = ""
        }
        else {
            reachableLabel.text = "Not Reachable"
        }
//        if(on) {
//            bulbImage.image = UIImage(named: "accessory on")
//        }
//        else {
//            bulbImage.image = UIImage(named: "accessory off")
//        }
        
    }
    
    @IBAction func switchAction(sender: UISwitch) {
        if(sender.on){
            bulbImage.image = UIImage(named: "accessory on")
            var services: [HMService] = homeManager.primaryHome.accessories[currentAccessory!].services as! [HMService]
            for service in services {
                for characteristic in service.characteristics {
                    if(characteristic.characteristicType == HMCharacteristicTypePowerState) {
                        characteristic.writeValue(true, completionHandler: { (error) -> Void in
                            println("Error in accessory list power state")
                        })
                    }
                }
            }
        }
        else {
            bulbImage.image = UIImage(named: "accessory off")
            var services: [HMService] = homeManager.primaryHome.accessories[currentAccessory!].services as! [HMService]
            for service in services {
                for characteristic in service.characteristics {
                    if(characteristic.characteristicType == HMCharacteristicTypePowerState) {
                        characteristic.writeValue(false, completionHandler: { (error) -> Void in
                            println("Error in accessory list power state")
                        })
                    }
                }
            }
        }
    }
}
