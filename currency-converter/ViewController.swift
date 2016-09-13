//
//  ViewController.swift
//  currency-converter
//
//  Created by Mariano Molina on 12/9/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencyInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Mostramos el teclado al iniciar la app.
        currencyInput.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

