//
//  ViewController.swift
//  PersistanceWithUserDefaults
//
//  Created by Megan Jannetty on 6/9/15.
//  Copyright (c) 2015 Megan Jannetty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MyTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loadFromDefaults()
    }
    
    let defaultsMgr = NSUserDefaults.standardUserDefaults()
    
    func saveInDefaults() {
        let text = self.myTextView.text
        self.defaultsMgr.setValue(text, forKey:"userText")
    }
    
    func loadFromDefaults() {
        if let savedText = self.defaultsMgr.valueForKey("userText") as? String {
            self.myTextView.text = savedText
        }
}