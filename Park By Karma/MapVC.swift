//
//  MapVC.swift
//  Park By Karma
//
//  Created by Rafsan Chowdhury on 6/8/17.
//  Copyright © 2017 Mcraf. All rights reserved.
//

import UIKit
import CoreLocation
import Firebase
import FirebaseAuth
import MapKit
import QuartzCore

class MapVC: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    private var locationManager: CLLocationManager!
    private var userCoordinates = CLLocation()
    
    private var _nameOfLotFromPrev: String!
    
    var nameOfLotFromPrev: String {
        get {
            return _nameOfLotFromPrev
        } set {
            _nameOfLotFromPrev = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLbl.text = nameOfLotFromPrev
        self.mapView.delegate = self
        self.mapView.layer.cornerRadius = 10.0
        
        self.mapView.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(42.955415, -78.819475), 250, 250), animated: true)
        
        self.determineMUsersCurrentLocation()
        
        // Do any additional setup after loading the view.
    }
    
    func determineMUsersCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 10;
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Call locationManager.stopUpdatingLocation()
        
        /*let userLocation: CLLocation = locations[0]
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print("Error getting the users location")
            } else {
                let placeArray = placemarks as [CLPlacemark]!
                var placeMark = placeArray?[0]
                print(placeMark?.administrativeArea)
                
                var coordinateParkingLot = CLLocation(latitude: 42.955415, longitude: -78.819475)
                
            }
        }*/
        let anno = MKPointAnnotation() //42.955447, -78.820137
        anno.title = "Empty"
        anno.coordinate = CLLocationCoordinate2D(latitude: 42.955447, longitude: -78.820137)
        
        self.mapView.addAnnotation(anno)
    }
    
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if (annotation is MKUserLocation) { return nil }
        
        let reuseID = "chest"
        var v = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID)
        
        if v != nil {
            v?.annotation = annotation
        } else {
            v = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            
            v?.image = UIImage(named:"MapPin")
        }
        
        return v
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("This is it", view.annotation!.coordinate.latitude , " and " , view.annotation!.coordinate.longitude)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}
