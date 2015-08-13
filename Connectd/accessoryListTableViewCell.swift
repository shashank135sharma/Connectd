//
//  accessoryListTableViewCell.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/3/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit

class accessoryListTableViewCell: UITableViewCell {

    @IBOutlet weak var reachableLabel: UILabel!
    @IBOutlet weak var bulbImage: UIImageView!
    @IBOutlet weak var nameOfAccessories: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUpCell(name: String, reachable: Bool) {
        nameOfAccessories.text = name
        if(reachable){
            reachableLabel.textColor = UIColor.whiteColor()
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
        }
        else {
            bulbImage.image = UIImage(named: "accessory off")
        }
    }
}
