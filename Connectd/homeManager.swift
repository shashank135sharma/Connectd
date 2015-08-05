//
//  HomeObject.swift
//  Connectd
//
//  Created by Shashank Sharma on 7/20/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class HomeManager: HMHomeManager, HMAccessoryBrowserDelegate, HMHomeManagerDelegate {
    static let sharedInstance = HomeManager()
    
    var totalAccessories: [HMAccessory]?
    
    lazy var accesoryBrowserFromManager: HMAccessoryBrowser = {
        let browser = HMAccessoryBrowser()
        browser.delegate = self
        return browser
        }()
    
    var currentHomeIndex: Int = 0
    var currentRoomIndex: Int = 0
    
    func createHome(homeName: String, completion:(home:HMHome!, errorMessage:String?)->Void) {
        addHomeWithName(homeName, completionHandler: { (home, error) -> Void in
            completion(home: home, errorMessage: getErrorMessage(error))
        })
    }
    
    func addAccessory(accessory:HMAccessory, completion:(errorMessage: String?)->Void) {
        primaryHome.addAccessory(accessory, completionHandler: { (error) -> Void in
            completion(errorMessage: getErrorMessage(error))
        })
    }
    
    func addRoom(roomName: String, completion: (errorMessage: String?) -> Void) {
        primaryHome.addRoomWithName(roomName, completionHandler: { (room, error) -> Void in
            completion(errorMessage: getErrorMessage(error))
        })
    }
}