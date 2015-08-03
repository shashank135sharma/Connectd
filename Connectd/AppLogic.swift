//
//  AppLogic.swift
//  Connectd
//
//  Created by Shashank Sharma on 7/20/15.
//  Copyright (c) 2015 Shashank Sharma. All rights reserved.
//

import UIKit

class AppLogic: NSObject {
    
}

public func getErrorMessage(error:NSError?) -> String? {
    if error == nil {
        return nil
    } else {
        return error!.localizedDescription
    }
}