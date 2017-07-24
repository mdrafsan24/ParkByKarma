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
class ParkingVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //var parkingSpotNames = [ParkingSpotNames]()
    

    var parkingSpotNames = ["Arena", "Alumni A", "Alumni B", "Alumni C", "Abbott A", "Baird A", "Cooke A", "Cooke B", "Crofts", "Clark (One Row Signed for Faculty Staff Only)", "Fargo", "Governors B", "Governors C", "Governors D", "Governors E", "Hochstetter B (Commuter Only Lot)", "Governors D", "Jacobs B", "Jacobs C", "Jarvis A (Commuter Only Lot)", "Jarvis B", "Jacobs C", "Ketter", "Lake LaSalle", "Main-Bailey", "Parker", "Red Jacket", "Richmond A", "Richmond B", "Special Event Parking", "Stadium", "Slee A", "Slee B", "Sherman", "Spaulding (One Row of Spaulding Faculty Staff Only)", "Townsend"]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // Search Bar Related
    var filteredParkingLots: [String]!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.searchBar.delegate = self
        self.filteredParkingLots = parkingSpotNames
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredParkingLots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nameOfSpot = filteredParkingLots[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "parkingCell") as? ParkingSpotCell {
            cell.configureCell(name: nameOfSpot, distance: "Distance: 5 miles", numSpotsEmpty: 10)
            return cell
        } else {
            return ParkingSpotCell()
        }
    }
    
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredParkingLots = searchText.isEmpty ? parkingSpotNames : parkingSpotNames.filter { (item: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        self.tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        self.filteredParkingLots = self.parkingSpotNames
        tableView.reloadData()
    }
    @IBAction func parkingLotClicked(_ sender: Any) {
        let clickPos: CGPoint = (sender as AnyObject).convert(CGPoint.zero, to: self.tableView)
        let indexPath: NSIndexPath = self.tableView.indexPathForRow(at: clickPos)! as NSIndexPath
        
        print(self.filteredParkingLots[indexPath.row])
        
        performSegue(withIdentifier: "goToMap", sender: self.filteredParkingLots[indexPath.row])
    }
    
    /*@IBAction func diseaseClicked(_ sender: Any) {
        
        let clickPos: CGPoint = (sender as AnyObject).convert(CGPoint.zero, to: self.tableView)
        let indexPath: NSIndexPath = self.tableView.indexPathForRow(at: clickPos)! as NSIndexPath
        /*self.selectionLbl.text = "You selected \(self.diseaseNamesAsString[indexPath.row])"
        self._disease = self.diseaseNamesAsString[indexPath.row]*/
    }*/


    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MapVC {
            if let parkingLotSelected = sender as? String {
                destination.nameOfLotFromPrev = parkingLotSelected
            }
        }
    }
    

}
