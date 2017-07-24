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
    
    private var _distanceFromUser: String!
    
    private var _numEmptySpots: Int!
    
    var spotName: String {
        if _spotName != nil {
            return _spotName
        } else {
            return ""
        }
    }
    
    var distanceFromUser: String {
        if _distanceFromUser != nil {
            return _distanceFromUser
        } else {
            return ""
        }
    }
    
    var numEmptySpots: Int {
        if _numEmptySpots != nil {
            return _numEmptySpots
        } else {
            return 0
        }
    }
    
    init(spotName: String, distanceFromUser: String, numEmptySpots: Int) {
        self._spotName = spotName
        self._distanceFromUser = distanceFromUser
        self._numEmptySpots = numEmptySpots
    }
}
