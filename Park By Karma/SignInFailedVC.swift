//
//  SignInFailedVC.swift
//  Park By Karma
//
//  Created by Rafsan Chowdhury on 5/25/17.
//  Copyright © 2017 Mcraf. All rights reserved.
//

import UIKit

class SignInFailedVC: UIViewController {

    @IBOutlet weak var signInFailedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    

}
