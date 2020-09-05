//
//  ViewController.swift
//  Hitch.io
//
//  Created by Utkarsh on 05/09/20.
//  Copyright © 2020 Utkarsh. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var passwordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
//        locationManager.requestLocation()
        
        
        
        emailTf.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTf.borderStyle = UITextField.BorderStyle.roundedRect
        
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
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
            print(lat)
            print(long)
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
}

