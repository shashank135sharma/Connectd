//
//  HomeManager.swift
//  Connectd
//
//  Created by Shashank Sharma on 7/20/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit
import HomeKit

class HomeManager: HMHomeManager, HMHomeManagerDelegate {
    static let sharedInstance = HomeManager()
    
    var discoveredAccessories: [HMAccessory]!
    var selectedAccessories: [HMAccessory]!
    
    var indices: [NSIndexPath]?
    
    var currentService: HMService?
    
    var currentHomeIndex: Int = 0
    var currentRoomIndex: Int = 0 
    var currentAccessoryIndex: Int = 0
    
    var targetMode: HMCharacteristic?
    var currentMode: HMCharacteristic?
    
    var tempUnit: HMCharacteristic?
    var currentTempCharacteristic: HMCharacteristic?
    
    func createHome(homeName: String, completion:(home:HMHome!, errorMessage:String?)->Void) {
        addHomeWithName(homeName, completionHandler: { (home, error) -> Void in
            completion(home: home, errorMessage: getErrorMessage(error))
        })
        currentHomeIndex = self.homes.count-1
    }
    
    func addAccessory(accessory:HMAccessory, completion:(errorMessage: String?)->Void) {
        self.primaryHome.addAccessory(accessory, completionHandler: { (error) -> Void in
            completion(errorMessage: getErrorMessage(error))
        })
    }
    
    func addRoom(roomName: String, completion: (errorMessage: String?) -> Void) {
        self.primaryHome.addRoomWithName(roomName, completionHandler: { (room, error) -> Void in
            completion(errorMessage: getErrorMessage(error))
            println("error adding room: \(error)")
        })
    }
}
