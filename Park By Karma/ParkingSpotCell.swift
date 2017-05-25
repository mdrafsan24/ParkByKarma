//
//  ParkingSpotCell.swift
//  Park By Karma
//
//  Created by Rafsan Chowdhury on 5/24/17.
//  Copyright © 2017 Mcraf. All rights reserved.
//

import UIKit
/*
 Type UITableViewCell: For reusuability purposes
 */
class ParkingSpotCell: UITableViewCell {

    @IBOutlet weak var parkingSpotNameLbl: UILabel!
    
    /*
     Called By ParkingVC database function to configure the cell 
     */
    func configureCell(name: ParkingSpotNames) {
        self.parkingSpotNameLbl.text = name.spotName
    }

    

}
