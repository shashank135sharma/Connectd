//
//  accessoryFinderMainTableViewController.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/10/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class accessoryFinderMainTableViewController: UITableViewController, HMAccessoryBrowserDelegate {
   
    let homeManager = HomeManager.sharedInstance
    var timer: NSTimer?
    var selectedAccessory: HMAccessory!
    var previousAccessory: HMAccessory!
    
    @IBOutlet weak var findingAccessoriesView: UIView!
    
    lazy var mainBrowser: HMAccessoryBrowser = {
        let browser = HMAccessoryBrowser()
        browser.delegate = self
        return browser
        }()
    
    func reloadTable() {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()

        mainBrowser.startSearchingForNewAccessories()
        homeManager.discoveredAccessories = mainBrowser.discoveredAccessories as! [HMAccessory]
        
        navigationController?.navigationBar.backItem?.title = "Accessories"

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

    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
        timer = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: "reloadTable", userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(animated: Bool) {
        mainBrowser.stopSearchingForNewAccessories()
        timer!.delete(self)
        
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    @IBAction func doneAdding(sender: AnyObject) {
//        for accessory in homeManager.selectedAccessories {
//            homeManager.addAccessory(accessory, completion: { (errorMessage) -> Void in
//                println("adding accessory error: \(errorMessage)")
//            })
//        }
        if(selectedAccessory != nil){
            homeManager.addAccessory(selectedAccessory, completion: { (errorMessage) -> Void in
                println("Adding error:  \(errorMessage)")
            })
        }
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
//        if(homeManager.discoveredAccessories !=  nil){
//            println("DiscoveredAccessories: \(homeManager.discoveredAccessories.count)")
//            return homeManager.discoveredAccessories!.count
//        }
//        else {
//            return 0
//        }
        homeManager.discoveredAccessories = mainBrowser.discoveredAccessories as! [HMAccessory]
        println("Num accessories discovered: \(homeManager.discoveredAccessories.count)")
        return homeManager.discoveredAccessories.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("accessoryFinderCell", forIndexPath: indexPath) as! accessoryFinderTableViewCell
        
        var accessory = homeManager.discoveredAccessories[indexPath.row]
        if(homeManager.discoveredAccessories == nil){
            println("Cell Set Up: \(homeManager.discoveredAccessories!.count)")
        }
        cell.setUpCell(accessory.name)
        
        return cell
    }
    
    func accessoryBrowser(browser: HMAccessoryBrowser, didFindNewAccessory accessory: HMAccessory!) {
        println("accessory found: \(accessory.name)")
        homeManager.discoveredAccessories.append(accessory)
        tableView.reloadData()
        //homeManager.discoveredAccessories?.append(accessory as HMAccessory)
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        var accessory: HMAccessory = homeManager.discoveredAccessories![indexPath.row]
//        homeManager.selectedAccessories?.append(accessory)
        selectedAccessory = homeManager.discoveredAccessories[indexPath.row]
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        var num = getIndexInArray(homeManager.selectedAccessories!, accessoryToFind: homeManager.discoveredAccessories![indexPath.row])
//        if(num != -1) {
//            homeManager.selectedAccessories?.removeAtIndex(num)
//        }
//        else {
//            println("line 101 error")
//        }
        selectedAccessory = nil
    }
    
    func getIndexInArray(arrayOfAccessories: [HMAccessory], accessoryToFind: HMAccessory) -> Int{
        tableView.reloadData()
        var counter = 0
        for accessory in arrayOfAccessories {
            if accessory == accessoryToFind {
                return counter
            }
            counter++
        }
        return -1
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
