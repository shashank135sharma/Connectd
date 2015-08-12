//
//  accessoryFinderTableViewController.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/3/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class accessoryFinderTableViewController: UITableViewController, HMAccessoryBrowserDelegate{
    
    let homeManager = HomeManager.sharedInstance
    var selectedAccessories: [HMAccessory]?
    var discoveredAccessories: [HMAccessory]?
    
    lazy var mainBrowser: HMAccessoryBrowser = {
        let browser = HMAccessoryBrowser()
        browser.delegate = self
        return browser
        }()
    
    override func viewDidLoad() {
        mainBrowser.startSearchingForNewAccessories()
        tableView.dataSource=self
        tableView.delegate = self
        tableView.reloadData()
        
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if((discoveredAccessories?.isEmpty) == false) {
            println("Accessory Found: \(discoveredAccessories!.count)")
            return discoveredAccessories!.count
        }
        else {
            return 0
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        mainBrowser.stopSearchingForNewAccessories()
    }
    
    func accessoryBrowser(browser: HMAccessoryBrowser, didFindNewAccessory accessory: HMAccessory!) {
        print("Accessory found")
        println(accessory.name)
        discoveredAccessories?.append(accessory as HMAccessory)
        for service in accessory.services {
            println(service.name)
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("accessoryFinderCell", forIndexPath: indexPath) as! accessoryFinderTableViewCell
        
        var accessory: HMAccessory = discoveredAccessories![indexPath.row]
        
        // Configure the cell...
        cell.setUpCell(accessory.name)
        return cell
    }
 
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedAccessories?.append(discoveredAccessories![indexPath.row] as HMAccessory)
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        selectedAccessories!.removeAtIndex(indexPath.row)
    }
    
    @IBAction func doneSelecting(sender: AnyObject) {
        if((selectedAccessories?.isEmpty) == false) {
            for accessory in selectedAccessories! {
                homeManager.addAccessory(accessory, completion: { (errorMessage) -> Void in
                    println("Selected message error: \(errorMessage)")
                })
            }
        }
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
