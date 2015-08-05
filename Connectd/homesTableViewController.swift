//
//  homesTableViewController.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/3/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class homesTableViewController: UITableViewController {
    let homeManager = HomeManager.sharedInstance

    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return homeManager.homes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("homeCell", forIndexPath: indexPath) as! homesTableViewCell
        var home: HMHome = homeManager.homes[indexPath.row] as! HMHome
        
        cell.setUpCell(home.name, numberOfRooms: home.rooms.count, numberOfAccessories: 0)
        
        return cell
    }
    
    @IBAction func addAlertView(sender: AnyObject) {

        var inputTextField: UITextField?
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "Add a home", message: "Enter a name for your new home", preferredStyle: .Alert)
        
        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
            inputTextField = textField
            inputTextField?.placeholder = "Living Room"
        }
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            println("Cancel")
        }
        
        actionSheetController.addAction(cancelAction)

        let nextAction: UIAlertAction = UIAlertAction(title: "Save", style: .Default) { action -> Void in
            
            self.homeManager.createHome(inputTextField!.text, completion: { (home, error) -> Void in

            })
            self.tableView.reloadData()
        }
        
        actionSheetController.addAction(nextAction)
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)

    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
     Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
             Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
             Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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