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
    var inputValue : String = ""
    var numberArray : [String] = []
    var entireCalc : [Double] = []
    var secondHalfCalc : [Double] = []
    var oneDot = 0
    var valueToConvert : Double {
        // Get the inputValue and convert to a Double
        return NSString(string:self.inputValue).doubleValue
    }
    
    @IBOutlet weak var outputValuelabel: UILabel!
    

    @IBAction func onButtonPressed(sender: UIButton) {
        let buttontext = sender.titleLabel!.text!
        if buttontext == "AC" {
            self.inputValue = "0"
            self.outputValuelabel.text = self.inputValue
            self.operation = nil
        } else if buttontext == "." {
            oneDot += 1
            if oneDot == 1 {
            self.inputValue += buttontext
            
//                if currentString == "0" {
//                    self.screenLabel.text = digit
//                } else {
//                    self.screenLabel.text = currentString + digit
//                }
//                //
                //
//            if self.operation !=nil && self.operand2 == nil{
//                    currentString = ""
//                }
            self.outputValuelabel.text = self.inputValue
                updateOperand()
            }
        }
        else
        //appending the array
        {
            println(self.outputValuelabel.text!)
            if self.outputValuelabel.text! == "0" {
                self.outputValuelabel.text = buttontext
            } else {
                self.outputValuelabel.text = self.outputValuelabel.text! + buttontext
            }
            
            self.numberArray.append(buttontext)
            println("\(numberArray)")
            self.inputValue += buttontext
            self.outputValuelabel.text = self.inputValue
        }
    }
    
    @IBAction func addition(sender: UIButton) {
        self.entireCalc.append(self.valueToConvert)
        println("\(entireCalc) value to convert +")
        numberArray.removeAll()
        oneDot = 0
        self.outputValuelabel.text = ""
        updateOperand()
        //secondHalfCalc = self.valueToConvert
    }
    @IBAction func pressedNegation(button: UIButton) {
        var inputValue:String = self.outputValuelabel.text!
        let firstChar = inputValue[inputValue.startIndex]
        println(firstChar)
        if firstChar == "-" {
            self.outputValuelabel.text = dropFirst(inputValue)
        } else {
            self.outputValuelabel.text = "-" + inputValue
            updateOperand()
        }
    }
    
    func updateOperand(){
        var inputValue:String = self.outputValuelabel.text!
        if self.operation == nil {
            self.operand1 = (inputValue as NSString).floatValue
        } else{
            self.operand2 = (inputValue as NSString).floatValue
        }
    }
    
    @IBAction func pressedOperation(button: UIButton) {
        self.operation = button.titleLabel!.text!
        
    }
    
    @IBAction func pressedEquals(sender: UIButton) {
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
                case "*":
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
    

    
    


    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

