//: Playground - noun: a place where people can play

import UIKit

//Create the user class and its parameters

class User {
    var userName: String
    var userGeoLocation: String
    var userEmail: String
    var dogBreedPreference: String?
    var dogAgePreference: String?
    var distanceFromDog: Int?
    var favoriteDogs: [User?] = []
    //var userPicture: String?

    init(userName:String) {
        self.userName = userName
    }
}

class Dog {
    var dogName: String
    var breed: String
    var dogGeoLocation: String
    var dogPictureUrl: String
    var dogPicture: UIImage?
    
    var favoriteDogs: [User] = []
    
    init(dogName:String) {
        self.dogName = dogName
    }
}
