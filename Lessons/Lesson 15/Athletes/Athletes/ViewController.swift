//
//  ViewController.swift
//  Athletes
//
//  Created by Megan Jannetty on 6/9/15.
//  Copyright (c) 2015 Megan Jannetty. All rights reserved.
//

import UIKit

var atheleteNames : [String] = []


class ViewController: UIViewController {

    @IBOutlet weak var userTextView: UITextView!
   
    @IBAction func onSaveTapped(sender: AnyObject) {
        //self.saveInDefaults()
        self.saveToPlist()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // self.loadFromDefaults()
        self.loadFromPlist()
    }
    
    func getPropertyListUrl() -> NSURL {
        let fileMgr = NSFileManager.defaultManager()
        
        let urls = fileMgr.URLsForDirectory(
            .DocumentDirectory,
            inDomains: .UserDomainMask
        )
        
        let documentsDirectory = urls.first as! NSURL
        
        let myPlist = documentsDirectory.URLByAppendingPathComponent(
            "myFirstPropertyList.plist",
            isDirectory: false
        )
        
        return myPlist
    }
    
    func saveToPlist() {
        let dataToSave: NSDictionary = [
            "textview_contents": self.myTextView.text,
            "favorite_numbers": [3.14159, 2.71828, 1.618, 0.0],
            "age": 36
        ]
        
        dataToSave.writeToURL(self.getPropertyListUrl(), atomically: true)
    }
    
    func loadFromPlist() {
        let savedData = NSDictionary(contentsOfURL: self.getPropertyListUrl())
        println(savedData)
}