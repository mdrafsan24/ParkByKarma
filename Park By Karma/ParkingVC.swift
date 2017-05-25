//
//  ParkingVC.swift
//  Park By Karma
//
//  Created by Rafsan Chowdhury on 5/24/17.
//  Copyright © 2017 Mcraf. All rights reserved.
//

import UIKit
import Firebase
import MapKit
class ParkingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var parkingSpotNames = [ParkingSpotNames]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkingSpotNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ParkingSpotCell()
    }

    

}
