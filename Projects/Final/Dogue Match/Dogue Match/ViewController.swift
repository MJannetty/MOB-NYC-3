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
    let api = PetFinderApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBOutlet weak var getDogImage: UIImageView!
    
    @IBAction func onDataTapped(sender: AnyObject) {
        self.api.fetchDogs(self.gotSomeDogs)
    }
    
    func gotSomeDogs() {
        println("WHEEEEE!")
        let firstDog = DogCollection.sharedInstance().collection[0]
        println(firstDog.pictureUrl!)
        let url = NSURL(string: firstDog.pictureUrl!)!
//        self.getDogImage.setImageWithURL(url)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
