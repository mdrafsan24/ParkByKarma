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
import GoogleSignIn
class MainVC: UIViewController {
    private var ref = Database.database().reference()

    @IBOutlet weak var sideBarConstraint: NSLayoutConstraint!

    @IBOutlet weak var karmaScoreLbl: UILabel!
    
    private var manuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addUserToDatabase()
    }
    
    /*
     This function grabs user data and updates the UI accordingly
     It also checks to make sure the user is in the database, if not it adds the user to the databse
     */
    func updateUserData() {
        
    }
    
    func addUserToDatabase() {
        let ref = Database.database().reference()
        let currentUser = Auth.auth().currentUser
        let uid = currentUser?.uid
        ref.child("UserBase").observe(DataEventType.value, with: { (snapshot) in
            if snapshot.hasChild(uid!){
                let userReference = ref.child("UserBase")
                let user = userReference.child(uid!)
                if let userDetails = snapshot.value as? [String: Any] {
                    if let userInfo = userDetails[uid!]! as? Dictionary<String, Any> {
                        print(userInfo["karmaScore"]!)
                        self.karmaScoreLbl.text = String(describing: userInfo["karmaScore"]!)
                    }
                    
                }
                
            }else{
                print("false room doesn't exist")
                let userReference = ref.child("UserBase")
                let newuserReference = userReference.child(uid!)
                newuserReference.setValue(["name": currentUser?.displayName as Any, "email": currentUser?.email as Any, "karmaScore": 0])
                let value = newuserReference.value(forKey: "karmaScore")
            }
        })

    }
    @IBAction func sideMenuControl(_ sender: Any) {
        if (!manuOpen) {
            sideBarConstraint.constant = 0
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
                self.manuOpen = !self.manuOpen
            }
        
        } else {
            sideBarConstraint.constant = -185
            UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
            self.manuOpen = !self.manuOpen
            }
        }
    }
    @IBAction func swipedRight(_ sender: UISwipeGestureRecognizer) {
        sideBarConstraint.constant = -185
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
            self.manuOpen = !self.manuOpen
        }
    }
    
}

