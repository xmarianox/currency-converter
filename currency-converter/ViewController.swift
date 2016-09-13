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
    @IBOutlet weak var buttonConstraintBottom: NSLayoutConstraint!

    
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
        
        // Add Keyboard EventListener
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
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
        buttonCalculate.clipsToBounds = true
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
            UIView.animateWithDuration(0.8, animations: {
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
    
    // keyboardWillShow
    func keyboardWillShow(notification: NSNotification) {
        let userInfo: NSDictionary = notification.userInfo!
        let keyboardFrame: NSValue = userInfo.valueForKey(UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.CGRectValue()
        let keyboardHeight = keyboardRectangle.height
        
        // update bottom constraint
        buttonConstraintBottom.constant = keyboardHeight + 30
    }
    
    // MARK: Events
    @IBAction func buttonCalculate(sender: AnyObject) {
        print("TAP TAP TAP!!")
    }

}

