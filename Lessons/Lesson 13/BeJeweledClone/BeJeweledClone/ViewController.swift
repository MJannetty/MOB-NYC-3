//
//  ViewController.swift
//  BeJeweledClone
//
//  Created by Megan Jannetty on 6/4/15.
//  Copyright (c) 2015 Megan Jannetty. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    @IBAction func onTap(sender:AnyObject) {
        println("TAP!")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let width = self.view.frame.width
        
        let boardFrame = CGRect(x: 0.0, y: 20.0, width: width, height: width)
        let board = Board(frame: boardFrame)
        board.backgroundColor = UIColor.lightGrayColor()
        
        self.view.addSubview(board)
        //self.view.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

