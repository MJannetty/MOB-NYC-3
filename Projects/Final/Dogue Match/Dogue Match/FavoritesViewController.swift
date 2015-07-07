//
//  FavoritesViewController.swift
//  Dogue Match
//
//  Created by Megan Jannetty on 7/6/15.
//  Copyright (c) 2015 Megan Jannetty. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController,
        UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var favoritesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Favorites.sharedInstance().dogs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FavoriteCell", forIndexPath: indexPath) as! UITableViewCell
        
        let dog = Favorites.sharedInstance().dogs[indexPath.row]
        cell.textLabel!.text = dog.name
        
        return cell
    }
}
