//
//  LoginViewController.swift
//  Trippie
//
//  Created by Helen Agha on 10/4/18.
//  Copyright © 2018 Helen Agha. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController :ViewController{
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showTripList", sender: self)
    }
    
}
