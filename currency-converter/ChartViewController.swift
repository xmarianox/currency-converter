//
//  ChartViewController.swift
//  currency-converter
//
//  Created by Mariano Molina on 14/9/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var resultAmount: UILabel!
    @IBOutlet weak var euroRowRate: UILabel!
    @IBOutlet weak var euroRowLabel: UILabel!
    @IBOutlet weak var realRowRate: UILabel!
    @IBOutlet weak var realRowLabel: UILabel!
    @IBOutlet weak var yenRowRate: UILabel!
    @IBOutlet weak var yenRowLabel: UILabel!
    @IBOutlet weak var poundRowRate: UILabel!
    @IBOutlet weak var poundRowLabel: UILabel!
    
    
    // MARK: Vars
    var rates = [Rate]()
    var amountSegue: String?
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentAmount = amountSegue {
            resultAmount.text = "$\(currentAmount)"
            
            getLastRate(currentAmount)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: Methods
    // Get data from API.
    func getLastRate(amount: String) {
        
        let endPoint = EndPoint()
        
        let services = CurrencyServices()
        services.fetch(endPoint) { (Rate) in
            if let rate = Rate {
                self.rates = rate
                
                self.setUpViews()
                
                self.setData(self.rates, amount: amount)
            }
        }
    }
    
    func setUpViews() {
        self.euroRowRate.alpha = 0
        self.euroRowLabel.alpha = 0
        self.poundRowRate.alpha = 0
        self.poundRowLabel.alpha = 0
        self.yenRowRate.alpha = 0
        self.yenRowLabel.alpha = 0
        self.realRowRate.alpha = 0
        self.realRowLabel.alpha = 0
        self.view.layoutIfNeeded()
    }
    
    // Add data to views
    func setData(rates: [Rate], amount: String) {
        // set euro data
        euroRowRate.text = calculateAmount(amount, currentRate: rates[3].rateValue, view: euroRowRate)
        euroRowLabel.text = rates[3].rateName
        
        // set euro data
        poundRowRate.text = calculateAmount(amount, currentRate: rates[1].rateValue, view: poundRowRate)
        poundRowLabel.text = rates[1].rateName
        
        // set euro data
        yenRowRate.text = calculateAmount(amount, currentRate: rates[2].rateValue, view: yenRowRate)
        yenRowLabel.text = rates[2].rateName
        
        // set euro data
        realRowRate.text = calculateAmount(amount, currentRate: rates[0].rateValue, view: realRowRate)
        realRowLabel.text = rates[0].rateName
        
        UIView.animateWithDuration(0.8, animations: {
            self.euroRowRate.alpha = 1
            self.euroRowLabel.alpha = 1
            
            self.poundRowRate.alpha = 1
            self.poundRowLabel.alpha = 1
            
            self.yenRowRate.alpha = 1
            self.yenRowLabel.alpha = 1
            
            self.realRowRate.alpha = 1
            self.realRowLabel.alpha = 1

            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    // Calculate Rate
    func calculateAmount(userAmount: String, currentRate: Double, view: UILabel) -> String {
        let result = Double(userAmount)! * currentRate
        
        if result < Double(userAmount)! {
            view.textColor = UIColor.redColor()
        } else {
            view.textColor = UIColor.greenColor()
        }
        
        return "$\(result)"
    }

}
