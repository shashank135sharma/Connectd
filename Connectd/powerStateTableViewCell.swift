//
//  powerStateTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/12/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class powerStateTableViewCell: UITableViewCell {
    var characteristic: HMCharacteristic?
    
    @IBOutlet weak var stateOutlet: UISegmentedControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpCell(characteristic: HMCharacteristic) {
        self.characteristic = characteristic
        if(self.characteristic != nil) {
            if(self.characteristic!.value as! Bool) {
                stateOutlet.selectedSegmentIndex = 0
            }
            else {
                stateOutlet.selectedSegmentIndex = 1
            }
        }
    }
    @IBAction func stateAction(sender: AnyObject) {
        if(sender.selectedSegmentIndex == 1){
            characteristic?.writeValue(false, completionHandler: { (error) -> Void in
                println("Power state error: \(error)")
            })
        }
        else {
            characteristic?.writeValue(true, completionHandler: { (error) -> Void in
                println("Power state error: \(error)")
            })
        }
    }

}
