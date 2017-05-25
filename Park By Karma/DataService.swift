//
//  DataService.swift
//  Park By Karma
//
//  Created by Rafsan Chowdhury on 5/24/17.
//  Copyright © 2017 Mcraf. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
let DB_BASE = Database.database().reference()//ROOT DB URL

class DataService {
    private var _parkingSpotName: String! // Name of the Parking Spot 
    
    static let ds = DataService() // Signleton For DataService
    
    private var _REF_BASE = DB_BASE // Root Database 
    
    
    
}
