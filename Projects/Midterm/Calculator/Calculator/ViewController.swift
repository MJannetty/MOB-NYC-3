//
//  ViewController.swift
//  Calculator
//
//  Created by Megan Jannetty on 6/1/15.
//  Copyright (c) 2015 Megan Jannetty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var inputValue : String = ""
    
    var valueToConvert : Double {
        // Get the inputValue and convert to a Double
        return NSString(string:self.inputValue).doubleValue
    }
    
    @IBOutlet weak var outputValuelabel: UILabel!
    

    @IBAction func onButtonPressed(sender: UIButton) {
        let buttontext = sender.titleLabel!.text!
        if buttontext == "AC" {
            self.inputValue = ""
        } else {
            self.inputValue += buttontext
        }
        self.outputValuelabel.text = self.inputValue
    }

    
    


    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

