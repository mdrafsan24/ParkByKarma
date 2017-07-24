//
//  SignInVc.swift
//  Park By Karma
//
//  Created by Rafsan Chowdhury on 5/24/17.
//  Copyright © 2017 Mcraf. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
class SignInVC: UIViewController, GIDSignInUIDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var launchScreenView: UIView!
    
    @IBOutlet weak var carConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var manualSignInBtn: UIButton!
    @IBOutlet weak var forgotDetailsButton: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
    
    @IBOutlet weak var loading: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.carConstraint.constant = 350
        UIView.animate(withDuration: 1.5, animations: {
            self.view.layoutIfNeeded()
        }) { (true) in
            self.launchScreenView.isHidden = true
        }
        setupGoogleSignIN()
        
    }

    private func setupGoogleSignIN() {
        // Google Sign In Button
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        signInButton.isEnabled = false
        signInButton.isHidden = true
        self.emailField.isHidden = true
        self.passwordField.isHidden = true
        self.manualSignInBtn.isHidden = true
        self.forgotDetailsButton.isHidden = true
        self.createAccountBtn.isHidden = true
        self.loading.isHidden = false
        UIView.animate(withDuration: 3, animations: {
            self.loading.transform = CGAffineTransform(rotationAngle: CGFloat(360))
            
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.loading.stopAnimating()
    }
}
