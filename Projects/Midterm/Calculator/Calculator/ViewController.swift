//
//  ViewController.swift
//  Calculator
//
//  Created by Megan Jannetty on 6/1/15.
//  Copyright (c) 2015 Megan Jannetty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var operand1: Float = 0
    var operation : String?
    var operand2:Float?

    @IBOutlet weak var outputValuelabel: UILabel!
    
    @IBAction func didTapInt(button: UIButton) {
        var digit:String = button.titleLabel!.text!
        var buttontext:String = self.outputValuelabel.text!
        if self.operation != nil && self.operand2 == nil {
            buttontext = "0"
        }
        if buttontext == "0" {
            self.outputValuelabel.text = digit
        } else {
            self.outputValuelabel.text = buttontext + digit
        }
        updateOperand()
    }
    
    @IBAction func didTapClear(button: UIButton) {
        self.outputValuelabel.text = "0"
        self.operation = nil
        self.operand1 = 0
        self.operand2 = nil
        
        updateOperand()
    }
    
    @IBAction func pressedDecimal(button: UIButton) {
        //check if current string has decimal
        var currentString:String = self.outputValuelabel.text!
        
        if self.operation != nil && self.operand2 == nil {
            currentString = "0"
        }
        
        if currentString.rangeOfString(".") == nil {
            self.outputValuelabel.text = currentString + "."
        }
        updateOperand()
    }

    @IBAction func pressedNegation(button: UIButton) {
        var buttontext:String = self.outputValuelabel.text!
        let firstChar = buttontext[buttontext.startIndex]
        println(firstChar)
        if firstChar == "-" {
            self.outputValuelabel.text = dropFirst(buttontext)
        } else {
            self.outputValuelabel.text = "-" + buttontext
        }
        updateOperand()
    }
    
    func updateOperand(){
        var buttontext:String = self.outputValuelabel.text!
        if self.operation == nil {
            self.operand1 = (buttontext as NSString).floatValue
        } else {
            self.operand2 = (buttontext as NSString).floatValue
        }
        
        println("Operand 1: \(self.operand1)")
        println("Operand 2: \(self.operand2)")
        
    }
    
    @IBAction func pressedOperation(button: UIButton) {
        self.operation = button.titleLabel!.text!
    
    }
    
    @IBAction func pressedEquals(button: UIButton) {
        
        if let operation =  self.operation {
            //do math
            println(operation)
            var result:Float = 0
            switch operation {
                case "+":
                //add
                result=self.operand1 + self.operand2!
                case "-":
                //subtraction
                    result=self.operand1 - self.operand2!
                case "x":
                //multiply
                result=self.operand1 * self.operand2!
                case "/":
                //divide
                result=self.operand1 / self.operand2!
            default:
                result = 0
            }
            self.outputValuelabel.text! = "\(result)"
        }
    }
}