//
//  ViewController.swift
//  BloodChain
//
//  Created by Drew Patel on 6/12/16.
//  Copyright © 2016 Cloudgration. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    @IBOutlet var scanButton: UIButton!
    
    @IBOutlet var navBar: UINavigationItem!
    
    @IBOutlet var createButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = FIRAuth.auth()?.currentUser {
            let name = user.displayName
            navBar.prompt = "User: " + name!
        } else {
            navBar.prompt = nil
        }
        // Do any additional setup after loading the view, typically from a nib.
      /*  scanButton.backgroundColor = UIColor.clearColor()
        scanButton.layer.cornerRadius = 5
        scanButton.layer.borderWidth = 1
        scanButton.layer.borderColor = UIColor(red: 146/255, green: 19/255, blue: 16/255, alpha: 1.0).CGColor
        createButton.backgroundColor = UIColor.clearColor()
        createButton.layer.cornerRadius = 5
        createButton.layer.borderWidth = 1
        createButton.layer.borderColor = UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 1.0).CGColor
      */
        scanButton.layer.shadowColor = UIColor.blackColor().CGColor
        scanButton.layer.shadowOffset = CGSizeMake(0, 0)
        scanButton.layer.shadowRadius = 5
        scanButton.layer.shadowOpacity = 0.3
        
        createButton.layer.shadowColor = UIColor.blackColor().CGColor
        createButton.layer.shadowOffset = CGSizeMake(0, 0)
        createButton.layer.shadowRadius = 5
        createButton.layer.shadowOpacity = 0.5
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

