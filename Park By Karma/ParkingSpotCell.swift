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
    
    @IBOutlet weak var distanceLbl: UILabel!
    @IBOutlet weak var numSpotsEmpty: UILabel!
    //@IBOutlet weak var parkingSpotBG: UIImageView!
    /*
     Called By ParkingVC database function to configure the cell 
     */
    func configureCell(name: String, distance: String, numSpotsEmpty: Int) {
        self.parkingSpotNameLbl.text = name
        self.distanceLbl.text = distance
        self.numSpotsEmpty.text = "\(numSpotsEmpty)"
    }

    

}
