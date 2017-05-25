//
//  ParkingSpotNames.swift
//  Park By Karma
//
//  Created by Rafsan Chowdhury on 5/24/17.
//  Copyright © 2017 Mcraf. All rights reserved.
//

import Foundation

/*
 Parking Spot Name Object for OO Purposes
 */

class ParkingSpotNames {
    private var _spotName: String!
    
    var spotName: String {
        if _spotName != nil {
            return _spotName
        } else {
            return ""
        }
    }
    
    init(spotName: String) {
        self._spotName = spotName
    }
}
