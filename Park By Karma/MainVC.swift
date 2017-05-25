//
//  ViewController.swift
//  Park By Karma
//
//  Created by Rafsan Chowdhury on 5/24/17.
//  Copyright © 2017 Mcraf. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class MainVC: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    public var name: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome \(Auth.auth().currentUser!.displayName!)..."
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    
}

