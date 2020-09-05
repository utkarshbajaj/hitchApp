//
//  ViewController.swift
//  Hitch.io
//
//  Created by Utkarsh on 05/09/20.
//  Copyright © 2020 Utkarsh. All rights reserved.
//

import UIKit
import CoreLocation
import Firebase

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var passwordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        
        // request to get users location
        locationManager.requestWhenInUseAuthorization()

        
        emailTf.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTf.borderStyle = UITextField.BorderStyle.roundedRect
        
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTf.text, let password = passwordTf.text {
            //registering new user on my Firebase App
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e);
                } else {
                    print("Authentication Done!")
                }
            }
        }
        
        // getting location on pressing register
        locationManager.requestLocation()
    }
}

//MARK: - CLLocationManager Delegate

extension ViewController: CLLocationManagerDelegate{
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location updated")
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            // printing longitude and latitude obtained
            print(lat)
            print(long)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}

