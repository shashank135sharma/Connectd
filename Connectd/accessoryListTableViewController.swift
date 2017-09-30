//
//  accessoryListTableViewController.swift
//  Connectd
////  Created by Shashank Sharma on 8/3/15.

//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class accessoryListTableViewController: UITableViewController {

    let homeManager = HomeManager.sharedInstance

    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "reloadTable", userInfo: nil, repeats: true)
        navigationController?.navigationBar.tintColor = UIColor(red: 33, green: 47, blue: 67, alpha: 1)
        super.viewDidLoad()
    }

    func reloadTable() {
        println("Number of added accessories: \(homeManager.primaryHome.accessories.count)")
        println("did update accessories")
        tableView.reloadData()
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
        if(homeManager.primaryHome != nil){
            return homeManager.primaryHome.accessories.count
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("accessoryListCell", forIndexPath: indexPath) as! accessoryListTableViewCell
        
        var accessory: HMAccessory = homeManager.primaryHome.accessories[indexPath.row] as! HMAccessory
                
        cell.setUpCell(accessory.name,reachable: accessory.reachable, accessoryInt: indexPath.row)
        //characteristics are types of actions - turning on off sliders, etc.
        //make different cells for each of the actions
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        homeManager.currentAccessoryIndex = indexPath.row
    }
}