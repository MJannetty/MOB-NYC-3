//
//  ViewController.swift
//  Dogue Match
//
//  Created by Megan Jannetty on 6/23/15.
//  Copyright (c) 2015 Megan Jannetty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dataTextView: UITextView!
    @IBAction func onDataTapped(sender: AnyObject) {
        self.getDogData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDogData() {
        println("getting you a dog") 
        
        let dataUrlStr = ("http://api.petfinder.com/pet.getRandom?format=json&key=762075e98ad072fbe909d4451bf3b896&animal=dog&output=full")
        let url = NSURL(string: dataUrlStr)
        
        let session = NSURLSession.sharedSession()
        
        func oncompletion(data: NSData!, response: NSURLResponse!, error: NSError!) {
            println("DONE!")
            
            var result:String = ""
            var e : NSError? = nil
            var json = NSJSONSerialization.JSONObjectWithData(
                data, options: NSJSONReadingOptions.MutableContainers,
                error: &e
                ) as? NSDictionary
            var breed:String = "Mutt"
            var size: String = "Unkown"
            println(json)
            if let petfinder = json?.valueForKey("petfinder") as? NSDictionary {
                if let pet = petfinder.valueForKey("pet") as? NSDictionary {
                    if let breeds = pet.valueForKey("breeds") as? NSDictionary {
                        if let _breed = breeds.valueForKey("breed") as? NSDictionary {
                            if let breedFound = _breed.valueForKey("$t") as? String {
                                breed = breedFound
                            }
                        } else if let _breed = breeds.valueForKey("breed") as? NSArray {
                            let firstbreed = _breed.firstObject as? NSDictionary
                            if let breedFound = firstbreed!.valueForKey("$t") as? String {
                                breed = "\(breedFound) Mix"
                            }
                        }
                    }
                    
                    if let sizeProperty = pet.valueForKey("size") as? NSDictionary {
                        if let _size = sizeProperty.valueForKey("$t") as? String {
                            size = _size
                            
                            switch _size {
                                case "S":
                                size = "Small"
                                case "M":
                                size = "Medium"
                                case "L":
                                size = "Large"
                                case "XL":
                                size = "Extra Large"
                                default:
                                size = "Unkown"
                            }
                        }
                    }
                    result = "The dog was a \(breed). It's size is \(size)."
                }
            }
            
            dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()) {
                self.dataTextView.text = result
            }
        }
        
        let dataTask = session.dataTaskWithURL(url!, completionHandler: oncompletion)
        dataTask.resume()
    }
}
