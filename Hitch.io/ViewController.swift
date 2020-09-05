//
//  ViewController.swift
//  Hitch.io
//
//  Created by Utkarsh on 05/09/20.
//  Copyright © 2020 Utkarsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var passwordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        emailTf.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTf.borderStyle = UITextField.BorderStyle.roundedRect
        
    }


}

