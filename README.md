# Currency Converter

Para correr el proyecto es necesario instalar [CocoaPods](https://cocoapods.org/) con el siguiente comando

```bash
$ sudo gem install cocoapods
```

Luego hay que instalar las dependencias del proyecto, [Alamofire](https://github.com/Alamofire/Alamofire) y [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)

```bash
$ pod install
```

Una vez instaladas las dependencias podemos abrir el proyecto

```bash
$ open currency-converter.xcworkspace
```

## Problem
You plan on traveling around the world using a stack of `$1 USD` dollar bills. 
Write an app that will calculate the exchange rate for any number of dollar bills, 
represented by an integer value, into the following currencies: 

* Pound sterling (`GBP`)
* Euro (`EUR`)
* Japanese Yen (`JPY`)
* Brazilian Real (`BRL`)

You can use the currency API from [fixer.io](http://fixer.io) to retrieve exchange 
rates from `USD` to the currencies previously mentioned above.

## Final Product
We give you freedom to come up with your own solution. We want to see at least an input text to enter the number of dollars
and the results of each currency. It doesn’t have to look great. 
Using raw (un-styled) native elements is just fine. We’re more interested in the code and structure. 
Make it functional and keep it organized. Write self­-documented code and/or documentation as you see fit.

## Bonus Points
* If you display results as a chart…
* If you also write tests…
* If your app runs in the majority of devices available…
* If you make the main logic reusable (as a lib for example)…
* If you use transitions/animations…

## PD
Please provide a complete working project (including build files, image resources, source files, libraries) and 
instructions on how to build and run the application. Along with the project please include enough tests to ensure 
the applications functionality. If you use a testing framework other than XCTest, please include instructions on 
how to run the tests.