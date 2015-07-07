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
        self.api.fetchDogs(self.renderCurrentDog)
    }
    
    var currentDogIndex : Int = 0
    var currentDog : Dog? {
        let dogsAreAlreadyLoaded = DogCollection.sharedInstance().collection.count > 0
        if dogsAreAlreadyLoaded {
            return DogCollection.sharedInstance().collection[self.currentDogIndex]
        } else {
            return nil
        }
    }

    func renderCurrentDog() {
        dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()) {
            // Show an image of the dog.
            let url = NSURL(string: self.currentDog!.pictureUrl!)!
            //let dogDescript = String /("Name" + "Breed")
            self.getDogImage.setImageWithURL(url)
            self.dataTextView.text = self.currentDog!.name
            //self.dataTextView.text = self.currentDog!.breed
        }
    }
    
    @IBAction func onSwipe(sender:UISwipeGestureRecognizer) {
        println("Swipe!")
        
        if sender.direction == .Right {
            println("Should save!")
            // Save that dog!
            Favorites.sharedInstance().dogs.append(self.currentDog!)
        }
        fetchNextDog()
    }
    
    func fetchNextDog(){
        // Refer to the next dog.
        self.currentDogIndex += 1
        
        // Update the UI to show the next dog.
        self.renderCurrentDog()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
