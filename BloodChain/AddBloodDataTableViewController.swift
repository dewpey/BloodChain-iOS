//
//  AddBloodDataTableViewController.swift
//  BloodChain
//
//  Created by Drew Patel on 6/12/16.
//  Copyright © 2016 Cloudgration. All rights reserved.
//

import UIKit

class AddBloodDataTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberOfRowsAtSection: [Int] = [3, 4, 1, 1, 1]
        return numberOfRowsAtSection[section]
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
    @IBAction func backButtonPress(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    @IBOutlet var genderBox: UITextField!
    @IBOutlet var ageBox: UITextField!
    @IBOutlet var countryBox: UITextField!
    @IBOutlet var bloodTypeBox: UITextField!
    @IBOutlet var HIVAidsBox: UITextField!
    @IBOutlet var drawnDate: UITextField!
    @IBOutlet var drawnLocation: UITextField!
    @IBOutlet var diseaseBox: UITextField!
    @IBOutlet var medicationsBox: UITextField!
    @IBOutlet var vaccinationsBox: UITextField!
    
    @IBAction func createCSV(_ sender: AnyObject) {
        var value: [String] = []
        value.append(genderBox.text!)
        value.append(ageBox.text!)
        value.append(countryBox.text!)
        value.append(bloodTypeBox.text!)
        value.append(HIVAidsBox.text!)
        value.append(drawnDate.text!)
        value.append(drawnLocation.text!)
        value.append(diseaseBox.text!)
        value.append(medicationsBox.text!)
        value.append(vaccinationsBox.text!)
        print(value)
        let csvString = value.joined(separator: ",")
        print(csvString)
    }
}
