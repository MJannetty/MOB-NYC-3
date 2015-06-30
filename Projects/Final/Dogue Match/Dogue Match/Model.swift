//
//  Model.swift
//  Dogue Match
//
//  Created by Megan Jannetty on 6/25/15.
//  Copyright (c) 2015 Megan Jannetty. All rights reserved.
//

//Create the user class and its parameters
import UIKit

class User {
    var name: String?
    var email: String?
    var location: String?
    var preferredBreed: String?
    var preferredAge: String?
    var favoriteDogs: [Dog] = []
    
}

class Dog {
    var location: String
    var breed: String
    var pictureUrl: String
    var email: String
    var dogPicture: UIImage?
    var name: String?
    
    init(pictureUrl:String, breed: String, location:String, email:String, dogPicture: UIImage) {
        self.location = location
        self.pictureUrl = pictureUrl
        self.breed = breed
        self.email = email
//        self.dogPicture = SDImages(name: url, url: url)
    }
    
}

class PetFinderApi {
    
    let base_api_url = "http://api.petfinder.com/pet.find?key=762075e98ad072fbe909d4451bf3b896&anial=dog&format=json&output=full"

    var breed: String?
    var size: String?
    var sex: String?
    var location: String?
    var age: String?
    var offset: Int?
    var count: Int = 25
    
    func buidUrl() -> String {
        var url = self.base_api_url;
        if let breed = self.breed {
            url += "&breed=" + breed
        }
        
        if let size = self.size {
            url += "&size=" + size
        }
        
        if let location = self.location {
            url += "&location=" + location
        }
        
        if let age = self.age {
            url += "&age=" + age
        }
        
        if let offset = self.offset {
            url += "&offset=" + "\(offset)"
        }
        
        url += "&offset=" + "\(count)"
        return url
    }
    
    func fetchDogs() {
        println("fetching a pretty dog")
        
        let url = NSURL(string: self.buidUrl())
        
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
            var size: String = "Unknown"
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
//                self.dataTextView.text = result
            }
        }
        
        let dataTask = session.dataTaskWithURL(url!, completionHandler: oncompletion)
        dataTask.resume()
    }
}

