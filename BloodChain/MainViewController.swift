//
//  ViewController.swift
//  BloodChain
//
//  Created by Drew Patel on 6/12/16.
//  Copyright © 2016 Cloudgration. All rights reserved.
//

import UIKit
import Foundation


class MainViewController: UIViewController {
  
    
    var csvRec:String = ""
    var valueSentFromSecondViewController:String?
    @IBOutlet var scanButton: UIButton!
    
    @IBOutlet var navBar: UINavigationItem!
    
    @IBOutlet var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

        scanButton.layer.borderWidth = 0.8
        scanButton.layer.borderColor = (UIColor( red: 146/255.0, green: 19/255.0, blue:16/255.0, alpha: 1.0 )).cgColor
        scanButton.layer.cornerRadius = 25

        createButton.layer.borderWidth = 0.8
        createButton.layer.borderColor = (UIColor( red: 0.5, green: 0.5, blue:0, alpha: 1.0 )).cgColor
    }
    
     
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(csvRec)
    }
    
}

