//
//  currentTempTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/12/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class currentTempTableViewCell: UITableViewCell {

    let homeManager = HomeManager.sharedInstance

    @IBOutlet weak var tempUnitOutlet: UISegmentedControl!
    @IBOutlet weak var currentTempLabel: UILabel!
    var isCelcius: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateTemp(){
        var temp: Float = homeManager.currentTempCharacteristic!.value as! Float
        if(isCelcius){
            currentTempLabel.text = "\(ceil(temp))°"
            tempUnitOutlet.selectedSegmentIndex = 0
            homeManager.tempUnit?.writeValue(0, completionHandler: { (error) -> Void in
                println("error current temp: \(error)")
            })
        }
        else{
            temp = temp/5
            temp = temp*9
            temp = temp+32
            currentTempLabel.text = "\(ceil(temp))°"
            tempUnitOutlet.selectedSegmentIndex = 1
            homeManager.tempUnit?.writeValue(1, completionHandler: { (error) -> Void in
                println("error current temp: \(error)")
            })
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(characteristic: HMCharacteristic) {
        
        if(characteristic.characteristicType == HMCharacteristicTypeTemperatureUnits) {
            homeManager.tempUnit = characteristic
            if(characteristic.value as! Int == 0){
                isCelcius = true
                tempUnitOutlet.selectedSegmentIndex = 0
            }
            else {
                isCelcius = false
                tempUnitOutlet.selectedSegmentIndex = 1
            }
        }
        else {
            homeManager.currentTempCharacteristic = characteristic
            NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTemp", userInfo: nil, repeats: true)
        }
        
        if(homeManager.currentTempCharacteristic!.value is Float)
        {
            var temp: Float = characteristic.value as! Float
            if(isCelcius){
                currentTempLabel.text = "\(ceil(temp))°"
                tempUnitOutlet.selectedSegmentIndex = 0
                homeManager.tempUnit?.writeValue(0, completionHandler: { (error) -> Void in
                    println("error current temp: \(error)")
                })
            }
            else{
                temp = temp/5
                temp = temp*9
                temp = temp+32
                currentTempLabel.text = "\(ceil(temp))°"
                tempUnitOutlet.selectedSegmentIndex = 1
                homeManager.tempUnit?.writeValue(1, completionHandler: { (error) -> Void in
                    println("error current temp: \(error)")
                })
            }
        }
        else {
            println("currentTemp is not of type float")
        }
    }
    
    @IBAction func tempUnitAction(sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            isCelcius = true
            updateTemp()
        }
        else {
            isCelcius = false
            updateTemp()
        }
    }
}
