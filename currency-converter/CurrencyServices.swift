//
//  CurrencyServices.swift
//  currency-converter
//
//  Created by Mariano Molina on 13/9/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct CurrencyServices {
    
    /**
        Fetch data from API.
     
        - Parameter url: EndPoint object.
     
        - Parameter callback:
     */
    func fetch(url: EndPoint, callback: [Rate]? -> () ) {
        
        // show network activityIndicator
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        Alamofire.request(.GET, url.BASE_URL)
            .validate()
            .responseJSON { response in
                switch response.result {
                    case .Success:
                        print("Validation Successful")
                
                        if let value = response.result.value {
                            let json = JSON(value)
                            
                            // hide network activityIndicator
                            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                            
                            dispatch_async(dispatch_get_main_queue()) {
                                callback(self.jsonParser(json))
                            }
                        }
                
                    case .Failure(let error):
                        print(error)
                        
                        // hide network activityIndicator
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                        
                        dispatch_async(dispatch_get_main_queue()){
                            callback(nil)
                        }
                }
        }
    }
    
    /**
     Parse JSON data.
     
     - Parameter json: `json` object from network.

     - Returns: `Rate` objects collection.
     */
    private func jsonParser(json: JSON) -> [Rate] {
        var rateList = [Rate]()
        
        if let BRL = json["rates"]["BRL"].double {
            if let GBP = json["rates"]["GBP"].double {
                if let JPY = json["rates"]["JPY"].double {
                    if let EUR = json["rates"]["EUR"].double {
                        
                        // Instantiate Rate Object
                        let real  = Rate(name: "BRL", value: BRL)
                        let yen   = Rate(name: "GBP", value: GBP)
                        let libra = Rate(name: "JPY", value: JPY)
                        let euro  = Rate(name: "EUR", value: EUR)
                        
                        // Add Objects to list
                        rateList.append(real)
                        rateList.append(yen)
                        rateList.append(libra)
                        rateList.append(euro)
                    }
                }
            }
        }
     
        return rateList
    }
    
}

struct EndPoint {
    let BASE_URL = "http://api.fixer.io/latest?base=USD&symbols=BRL,GBP,EUR,JPY"
}