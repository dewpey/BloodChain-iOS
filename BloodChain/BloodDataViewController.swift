//
//  BloodDataViewController.swift
//  BloodChain
//
//  Created by Drew Patel on 6/12/16.
//  Copyright © 2016 Cloudgration. All rights reserved.
//

import UIKit
import Foundation

class BloodDataViewController: UITableViewController {

    var csvRec = ""
    
    
    @IBOutlet var bloodView: UITableView!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var bloodTypeLabel: UILabel!
    @IBOutlet var hivAidsLabel: UILabel!
    @IBOutlet var drawnDateLabel: UILabel!
    @IBOutlet var drawnLocationLabel: UILabel!
    @IBOutlet var diseaseLabel: UILabel!
    @IBOutlet var medicationsLabel: UILabel!
    @IBOutlet var vaccinationsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        csvRec = "https://testnet.etherscan.io/api?module=proxy&action=eth_getTransactionByHash&txhash=" + csvRec + "&apikey=YourApiKeyToken"
        var url = NSURL(string: csvRec)
        
        
        if url != nil {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                
                if error == nil {
                    
                    var urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding) as NSString!
                    var content = urlContent as String
                    print(content)
                    var error: NSError?
                    var data: NSData=urlContent.dataUsingEncoding(NSUTF8StringEncoding)!
                    var hoge = JSON(data: data)
                    print(hoge)
                    let result = hoge["result"].object
                    print(result)
                    var input = result["input"]!
                    input = input?.substringFromIndex(2)
                    print(input!)
                    var ascii = self.hexStringtoAscii(input! as! String)
                    print(ascii);
                    var arr = ascii.componentsSeparatedByString(",")
                    print(arr)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.genderLabel.text = "Gender: " + arr[0] as String!
                    self.bloodView.reloadData()
                    self.ageLabel.text = "Age: " + arr[1] as String!
                    self.countryLabel.text = "Country/Region: " + arr[2] as String!
                    self.bloodTypeLabel.text = "Blood Type: " + arr[3] as String!
                    self.hivAidsLabel.text = "HIV/Aids?: " + arr[4] as String!
                    self.drawnDateLabel.text = "Drawn Date: " + arr[5] as String!
                    self.drawnLocationLabel.text = "Drawn Location: " + arr[6] as String!
                    self.diseaseLabel.text = arr[7] as String!
                    self.medicationsLabel.text = arr[8] as String!
                    self.vaccinationsLabel.text = arr[9] as String!
                    
                    self.bloodView.reloadData()
                        })
                }
            })
        
            task.resume()

        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberOfRowsAtSection: [Int] = [3, 4, 1, 1, 1]
        return numberOfRowsAtSection[section]
    }

        func hexStringtoAscii(hexString : String) -> String {
        
        let pattern = "(0x)?([0-9a-f]{2})"
        let regex = try! NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
        let nsString = hexString as NSString
        let matches = regex.matchesInString(hexString, options: [], range: NSMakeRange(0, nsString.length))
        let characters = matches.map {
            Character(UnicodeScalar(UInt32(nsString.substringWithRange($0.rangeAtIndex(2)), radix: 16)!))
        }
        return String(characters)
    }
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
