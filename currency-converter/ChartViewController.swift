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
                
                self.setData(self.rates, amount: amount)
            }
        }
    }
    
    // Add data to views
    func setData(rates: [Rate], amount: String) {
        // set euro data
        euroRowRate.text = calculateAmount(amount, currentRate: rates[3].rateValue)
        euroRowLabel.text = rates[3].rateName
        
        // set euro data
        poundRowRate.text = calculateAmount(amount, currentRate: rates[1].rateValue)
        poundRowLabel.text = rates[1].rateName
        
        // set euro data
        yenRowRate.text = calculateAmount(amount, currentRate: rates[2].rateValue)
        yenRowLabel.text = rates[2].rateName
        
        // set euro data
        realRowRate.text = calculateAmount(amount, currentRate: rates[0].rateValue)
        realRowLabel.text = rates[0].rateName
    }
    
    // Calculate Rate
    func calculateAmount(userAmount: String, currentRate: Double) -> String {
        let result = Double(userAmount)! * currentRate
        
        return "$\(result)"
    }

}
