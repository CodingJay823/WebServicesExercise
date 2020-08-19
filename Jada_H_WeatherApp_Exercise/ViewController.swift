//
//  ViewController.swift
//  Jada_H_WeatherApp_Exercise
//
//  Created by Jada Harmon on 8/13/20.
//  Copyright © 2020 Jada Harmon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //TODO: Step 1
        //Tell my function where to look for the weather data
        //
        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/41.8781,87.6298"){
               if let data = NSData(contentsOf: url as URL){
                   
                   //TODO: Step 2
                   //Parse through the data
                   //
                   do {
                       let parsed  = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                       //TODO: This Step 3
                       //Temporarily store the parsed data in a dictionary
                       let newDict = parsed
                       
                       //TODO: Step 4
                       //Print out these 3 pieces of data in the terminal window to check them
                        print(newDict["currently"]!["summary"] as Any)
                        print(newDict["currently"]!["temparature"] as Any)
                        print(newDict["currently"]!["dewPoint"] as Any)
                       
                        self.currentTemp.text = "\(newDict["currently"]!["temperature"]!!)"
                        self.currentSummary.text = "\(newDict["currently"]!["summary"]!!)"
                        self.currentDewpoint.text = "\(newDict["currently"]!["dewPoint"]!!)"
                   
                    }
                    
                    //TODO: Step 5
                    //Print the error
                   catch let error as NSError {
                        print("A JSON parsithing error occured, here are the details: \n \(error)")
                    }
            }
        }
    }
    
    //TODO: Step 6
    //Make the outlets
    @IBOutlet var currentTemp: UILabel!
    
    @IBOutlet var currentSummary: UILabel!
    
    @IBOutlet var currentDewpoint: UILabel!
}

