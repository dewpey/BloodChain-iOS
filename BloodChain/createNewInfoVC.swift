//
//  createBloodQRVC.swift
//  BloodChain
//
//  Created by Drew Patel on 10/29/16.
//  Copyright © 2016 Cloudgration. All rights reserved.
//

import UIKit
import Eureka
import Alamofire
import SwiftyJSON
class createNewInfoVC: FormViewController {

    @IBOutlet var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        form += Section("Basic Info")
            <<< ActionSheetRow<String>("sex") {
                $0.title = "Gender"
                $0.selectorTitle = "Pick donor's gender"
                $0.options = ["Male","Female","Trans: M to F", "Trans: F to M"]
                $0.value = "Select.."    // initially selected
            }
            <<< IntRow("age"){
                $0.title = "Age"
                $0.placeholder = "20"
            }

            +++ Section("Blood Information")
            <<< ActionSheetRow<String>("type") {
                $0.title = "Blood Type"
                $0.selectorTitle = "Pick donor's blood type"
                $0.options = ["A+","A-","B+","B-","AB+","AB-","O+","O-"]
                $0.value = "Select.."
            }
            <<< IntRow("amount"){
                $0.title = "Drawn Amount (CCs)"
                $0.value = 10
        }
        
        //createTextRow(Title: "sawg", Type: 1 , Placeholder: "dong", formU: form)
        //createDatePicker(Title:"dank", formU: form)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func donePressed(_ sender: Any) {
        let valuesDictionary: Dictionary! = form.values()
        let sex = valuesDictionary["sex"]! as! String
        let age = valuesDictionary["age"]! as! Int
        let amount = valuesDictionary["amount"]! as! Int
        let type = valuesDictionary["type"]! as! String
        print(valuesDictionary)
        var transJson = """
["alice","\(sex)",\(age),"\(type)",\(amount)]
"""

        
        TransactionUtil.pushTransaction(code: "bloodchain2", action: "upsert", paramsJson: transJson, account: "alice", pkString: "5Hs6rBFC5pMQVWRbhbiUR3KKZUnCfLfjZJRM1xYZsJpXh7wukTm") { (result, error) in
            if error != nil {
                if (error! as NSError).code == RPCErrorResponse.ErrorCode {
                    print("\(((error! as NSError).userInfo[RPCErrorResponse.ErrorKey] as! RPCErrorResponse).errorDescription())")
                } else {
                    print("other error: \(String(describing: error?.localizedDescription))")
                }
            } else {
                print("Ok. Txid: \(result!.transactionId)")
            }
        }
        
    }
    
    
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


