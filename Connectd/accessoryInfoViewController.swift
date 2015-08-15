//
//  accessoryInfoViewController.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/14/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class accessoryInfoViewController: UIViewController {
    let homeManager = HomeManager.sharedInstance

    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        var service = homeManager.currentService
        
        for characteristic in service?.characteristics as! [HMCharacteristic] {
            if(characteristic.characteristicType == HMCharacteristicTypeName) {
                nameLabel.text = "Name: \(characteristic.value as! String)"
            }
        }
        for characteristic in service?.characteristics as! [HMCharacteristic] {
            if(characteristic.characteristicType == HMCharacteristicTypeManufacturer) {
                manufacturerLabel.text = "Manufacturer: \(characteristic.value as! String)"
            }
        }
        for characteristic in service?.characteristics as! [HMCharacteristic] {
            if(characteristic.characteristicType == HMCharacteristicTypeModel) {
                modelLabel.text = "Model: \(characteristic.value as! String)"
            }
        }
        for characteristic in service?.characteristics as! [HMCharacteristic] {
            if(characteristic.characteristicType == HMCharacteristicTypeSerialNumber) {
                serialNumberLabel.text = "Serial Number: \(characteristic.value as! String)"
            }
        }


    }
}
