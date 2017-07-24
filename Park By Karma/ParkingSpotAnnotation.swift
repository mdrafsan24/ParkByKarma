//
//  ParkingSpotAnnotation.swift
//  Park By Karma
//
//  Created by Rafsan Chowdhury on 7/24/17.
//  Copyright © 2017 Mcraf. All rights reserved.
//
import Foundation
import MapKit

class ParkingSpotAnnotation: NSObject, MKAnnotation {
    
    var coordinate = CLLocationCoordinate2D()
    
    //Part of MKAnnotation
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
