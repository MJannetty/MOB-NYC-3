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

class DogCollection {
    var collection:[Dog] = []
    static var _dogCollection: DogCollection?
    static func sharedInstance() -> DogCollection {
        if let dogs=_dogCollection {
            return dogs
        } else {
            _dogCollection = DogCollection()
            return _dogCollection!
        }
    }
}

class Dog {
    var location: String
    var breed: String
    var pictureUrl: String?
    var email: String
    var dogPicture: UIImage?
    var name: String
    
    init(name: String, pictureUrl:String, breed: String, location:String, email:String) {
        self.name = name
        self.location = location
        self.pictureUrl = pictureUrl
        self.breed = breed
        self.email = email
//        self.dogPicture = SDImages(name: url, url: url)
    }
    
}

class PetFinderApi {
    
    let base_api_url = "http://api.petfinder.com/pet.find?key=762075e98ad072fbe909d4451bf3b896&animal=dog&format=json&output=full"

    var breed: String?
    var size: String?
    var sex: String?
    var location: String? = "10001"
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
    
    func fetchDogs(onDone:(() -> Void)) {
        println("fetching a pretty dog")
        let url = NSURL(string: self.buidUrl())
        println(url)
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url!, completionHandler: {
            (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            self.oncompletion(data, response: response, error: error)
            onDone()
        })
        dataTask.resume()
    }
    
    func oncompletion(data: NSData!, response: NSURLResponse!, error: NSError!){
        println("DONE!")
        
        if let err = error {
            println(err.description)
        } else {
            let response = JSON(data: data)
            if let pets = response["petfinder"]["pets"]["pet"].array {
                for pet in pets {
                    println(pet["media"]["photos"]["photo"][0]["$t"].string)
                    //define Dog objects
                    var breed : String
                    if let multi = pet["breeds"]["breed"].array {
                        breed = multi[0]["$t"].string!
                    } else {
                        breed = pet["breeds"]["breed"]["$t"].string!
                    }
                    
                    //only use dogs with photos
                    if let _pictureUrl = pet["media"]["photos"]["photo"][0]["$t"].string {
                        var dog = Dog(
                            name: pet["name"]["$t"].string!,
                            pictureUrl: _pictureUrl,
                            breed: breed,
                            location: location!,
                            email: pet["contact"]["email"]["$t"].string!
                        )
                        DogCollection.sharedInstance().collection.append(dog)
                    }
                    //add Dog object to Dog Collection
                }
            }
            
            
            /*
]
            
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
                        if let media = pet.valueForKey("media") as? NSDictionary {
                            if let photos = media.valueForKey ("photos") as? NSDictionary {
                                if let _photo = photos.valueForKey ("$t") as? String {
                                    println(_photo)
                                }
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
                                size = "Unknown"
                            }
                        }
                    }
                    result = "The dog was a \(breed). It's size is \(size)."
                }
            }
*/
        }
//        dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue() {
    }
}