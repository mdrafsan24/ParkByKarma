//
//  SignInVc.swift
//  Park By Karma
//
//  Created by Rafsan Chowdhury on 5/24/17.
//  Copyright © 2017 Mcraf. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
class SignInVC: UIViewController, GIDSignInUIDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGoogleSignIN()
        DispatchQueue.main.async() {
            if Auth.auth().currentUser != nil {
                print(Auth.auth().currentUser!.email!)
                self.performSegue(withIdentifier: "didSignIn", sender: self)
            } else {
                //User Not logged in
            }

        }
        
    }
    
    
    
    private func setupGoogleSignIN() {
        // Google Sign In Button
        GIDSignIn.sharedInstance().uiDelegate = self
    }
}
