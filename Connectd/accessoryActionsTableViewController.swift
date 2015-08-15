//
//  accessoryActionsTableViewController.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/3/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class accessoryActionsTableViewController: UITableViewController {

    let homeManager = HomeManager.sharedInstance
    var alreadyChanged = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        if(homeManager.primaryHome.accessories[homeManager.currentAccessoryIndex].services != nil){
            return homeManager.primaryHome.accessories[homeManager.currentAccessoryIndex].services!.count - 1
        }
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        var service: HMService = homeManager.primaryHome.accessories[homeManager.currentAccessoryIndex].services?[section] as! HMService
        return service.characteristics.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(homeManager.indices != nil) {
            for i in homeManager.indices! {
                if i == indexPath {
                    println("did make it 0")
                    return 0
                }
            }
        }
        println("did make it 90")
        return 90
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var returnCell: AnyObject?
        var service: HMService = homeManager.primaryHome.accessories[homeManager.currentAccessoryIndex].services![indexPath.section+1] as! HMService        // Configure the cell...
        homeManager.currentService = service
        var characteristic: HMCharacteristic = service.characteristics[indexPath.row] as! HMCharacteristic
        
        if(characteristic.characteristicType == HMCharacteristicTypePowerState) {
            var cell = tableView.dequeueReusableCellWithIdentifier("powerStateCell", forIndexPath: indexPath) as! powerStateTableViewCell
            cell.setUpCell(characteristic)
            returnCell = cell
        }
        else if characteristic.characteristicType == HMCharacteristicTypeSaturation {
            var cell = tableView.dequeueReusableCellWithIdentifier("setSaturationCell", forIndexPath: indexPath) as! saturationTableViewCell
            cell.setUpCell(characteristic)
            returnCell = cell
        }
        else if characteristic.characteristicType == HMCharacteristicTypeTargetDoorState {
            var cell = tableView.dequeueReusableCellWithIdentifier("lockStateCell", forIndexPath: indexPath) as! currentDoorLockStateTableViewCell
            cell.setUpCell(characteristic)
            returnCell = cell
        }
        else if characteristic.characteristicType == HMCharacteristicTypeCurrentTemperature || characteristic.characteristicType == HMCharacteristicTypeTemperatureUnits {
            var cell = tableView.dequeueReusableCellWithIdentifier("currentTempCell", forIndexPath: indexPath) as! currentTempTableViewCell
            cell.setUpCell(characteristic)
            returnCell = cell
        }
        else if characteristic.characteristicType == HMCharacteristicTypeTargetHeatingCooling || characteristic.characteristicType == HMCharacteristicTypeCurrentHeatingCooling {
            var cell = tableView.dequeueReusableCellWithIdentifier("targetModeCell", forIndexPath: indexPath) as! targetHeatingCoolingModeTableViewCell
            cell.setUpCell(characteristic)
            returnCell = cell

        }
        else if characteristic.characteristicType == HMCharacteristicTypeTargetTemperature {
            var cell = tableView.dequeueReusableCellWithIdentifier("setTempCell", forIndexPath: indexPath) as! desiredTempTableViewCell
            cell.setUpCell(characteristic)
            returnCell = cell
        }
        else if characteristic.characteristicType == HMCharacteristicTypeBrightness {
            var cell = tableView.dequeueReusableCellWithIdentifier("brightnessControlCell", forIndexPath: indexPath) as! brightnessTableViewCell
            cell.setUpCell(characteristic)
            returnCell = cell
        }
        else if characteristic.characteristicType == HMCharacteristicTypeRotationSpeed {
            var cell = tableView.dequeueReusableCellWithIdentifier("fanPowerLevelCell", forIndexPath: indexPath) as! fanPowerLevelTableViewCell
            cell.setUpCell(characteristic)
            returnCell = cell
        }
        else {
            var cell = tableView.dequeueReusableCellWithIdentifier("unrecognizedCharacteristic", forIndexPath: indexPath) as! UITableViewCell
            cell.hidden = true
            returnCell = cell
            if(!alreadyChanged){
                homeManager.indices = [indexPath]
                alreadyChanged = true
            }
            else {
                homeManager.indices?.append(indexPath)
            }
            println("indices count: \(homeManager.indices?.count)")
        }
    
        return returnCell as! UITableViewCell
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var service: HMService = homeManager.primaryHome.accessories[homeManager.currentAccessoryIndex].services?[section+1] as! HMService
        return service.name
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
