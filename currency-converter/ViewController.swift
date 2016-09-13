//
//  ViewController.swift
//  currency-converter
//
//  Created by Mariano Molina on 12/9/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var currencyInput: UITextField!
    @IBOutlet weak var buttonCalculate: UIButton!
    
    
    // MARK: Lifecycle
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configuramos la vista inicial
        setUpViews()
        
        // Add textField EventListener
        currencyInput.addTarget(self, action: #selector(ViewController.inputDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: Helpers Functions
    func setUpViews() {
        // Mostramos el teclado al iniciar la app.
        currencyInput.becomeFirstResponder()
        // Ocultamos el button
        buttonCalculate.layer.cornerRadius = 10
        buttonCalculate.alpha = 0
    }
    
    // validate text field did change
    func inputDidChange(textField: UITextField) {
        if textField.text == "" {
            switchButtonState(false)
        } else {
            switchButtonState(true)
        }
    }
    
    // change button state
    func switchButtonState(enabled: Bool) {
        switch enabled {
        case true:
            UIView.animateWithDuration(0.5, animations: {
                self.buttonCalculate.alpha = 1
                self.view.layoutIfNeeded()
            }, completion: nil)
        case false:
            UIView.animateWithDuration(0.35, animations: {
                self.buttonCalculate.alpha = 0
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    
    // MARK: Events
    @IBAction func buttonCalculate(sender: AnyObject) {
        print("TAP TAP TAP!!")
    }

}

