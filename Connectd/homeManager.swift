//
//  HomeObject.swift
//  Connectd
//
//  Created by Shashank Sharma on 7/20/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class HomeManager: HMHomeManager, HMHomeManagerDelegate {
    static let sharedInstance = HomeManager()
    
    //var totalAccessories: [HMAccessory]?
    var discoveredAccessories: [HMAccessory]!
    var selectedAccessories: [HMAccessory]!
    
    var currentHomeIndex: Int = 0
    var currentRoomIndex: Int = 0 
    var currentAccessoryIndex: Int = 0
    
    func createHome(homeName: String, completion:(home:HMHome!, errorMessage:String?)->Void) {
        addHomeWithName(homeName, completionHandler: { (home, error) -> Void in
            completion(home: home, errorMessage: getErrorMessage(error))
        })
        currentHomeIndex = self.homes.count-1
    }
    
    func addAccessory(accessory:HMAccessory, completion:(errorMessage: String?)->Void) {
        self.homes[currentHomeIndex].addAccessory(accessory, completionHandler: { (error) -> Void in
            completion(errorMessage: getErrorMessage(error))
        })
    }
    
    func addRoom(roomName: String, completion: (errorMessage: String?) -> Void) {
        primaryHome.addRoomWithName(roomName, completionHandler: { (room, error) -> Void in
            completion(errorMessage: getErrorMessage(error))
        })
    }
}