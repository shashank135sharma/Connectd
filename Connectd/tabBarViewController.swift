//
//  tabBarViewController.swift
//  Connectd
//
//  Created by Shashank Sharma on 8/13/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit

class tabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var item1: UITabBarItem = tabBar.items?[0] as! UITabBarItem
        var item2: UITabBarItem = tabBar.items?[1] as! UITabBarItem
        
        var UIControlStateVar = UIControlState.Disabled
        
        item1.image = UIImage(named: "Home tab filled")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        item2.image = UIImage(named: "Actions tab unfilled")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)

        item1.title = "Homes"
        item2.title = "Accessories"
        
        println("Tab Bar Properties1: \(item1.titleTextAttributesForState(UIControlStateVar))")
        println("Tab Bar Properties2: \(item2.titleTextAttributesForState(UIControlStateVar))")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }

    /*r
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
