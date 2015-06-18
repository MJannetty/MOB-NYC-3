//
//  ViewController.swift
//  Networking
//
//  Created by Megan Jannetty on 6/16/15.
//  Copyright (c) 2015 Megan Jannetty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func onDataTapped(sender: AnyObject) {
        self.getsomedata()
    }

    @IBOutlet weak var dataTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
        
    
    }

    func getsomedata() {
        println("Getting Some Data!")
        let dataURLstr = "http://mashable.com/stories.json"
        let url = NSURL(string:dataURLstr)
        
        let session = NSURLSession.sharedSession()
        
        func onCompletion(data:NSData!, response: NSURLResponse!, error:NSError!){
            println("DONE!")
            
            let str = NSString(data: data, encoding: NSUTF8StringEncoding)!
            println(str)
            
            var e: NSError? = nil
            let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &e
            ) as? NSDictionary
            
            let hotArticles = json?.valueForKey("hot") as? NSArray
            let firstArticle = hotArticles?.objectAtIndex(0) as? NSDictionary
            
            let title = firstArticle?.valueForKey("title") as? NSString
            let excerpt = firstArticle?.valueForKey("excerpt") as? NSString
            
            let result = "The title was \(title!). It's about \(excerpt!)."
            
            dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()){
                self.dataTextView.text = result
            }
        }
        
        let dataTask = session .dataTaskWithURL(url!, completionHandler: onCompletion)
        dataTask.resume()
    }
    @IBOutlet weak var getImage: UIImageView!
    
    @IBAction func onImageTapped(sender: AnyObject) {

        let imageUrlStr = "http://truestorieswithgill.com/wp-content/uploads/2013/09/20130915-190532.jpg"
        let url = NSURL(string: imageUrlStr)
        
        let session = NSURLSession.sharedSession()
    
        func onCompletion (location:NSURL!, response: NSURLResponse!, error:NSError!) {
            println("Done with getting inage data!")
        
            let imageData = NSData(contentsOfURL: location)
            let img = UIImage(data: imageData!)
        
            dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()){
                self.getImage.image = img
            }
        }
        
        let imageTask = session.downloadTaskWithURL(url!, completionHandler: onCompletion)
        imageTask.resume()
    }

}
