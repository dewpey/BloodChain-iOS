//
//  LoginViewController.swift
//  BloodChain
//
//  Created by Drew Patel on 8/1/16.
//  Copyright © 2016 Cloudgration. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import FirebaseAuth
import Alamofire


class LoginViewController: UIViewController {
    @IBOutlet var emailBox: SkyFloatingLabelTextField!
    @IBOutlet var passBox: SkyFloatingLabelTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        let (pk, pub, mn) = generateRandomKeyPair(enclave: .Secp256k1)
        print("private key: \(pk!.rawPrivateKey())")
        print("public key : \(pub!.rawPublicKey())")
        print("mnemonic : \(mn ?? "")")
        EOSRPC.sharedInstance.chainInfo { (chainInfo, error) in
            if error == nil {
                print("Success: \(chainInfo!)")
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        }
    }
    
//    func keyboardWillShow(_ notification: Notification) {
//        
//        if let keyboardSize = ((notification as NSNotification).userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if view.frame.origin.y == 0{
//                self.view.frame.origin.y -= keyboardSize.height - 50
//            }
//            else {
//                
//            }
//        }
//        
//    }
//    
//    func keyboardWillHide(_ notification: Notification) {
//        if let keyboardSize = ((notification as NSNotification).userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if view.frame.origin.y != 0 {
//                self.view.frame.origin.y += keyboardSize.height + 50
//            }
//            else {
//                
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func signIn(_ sender: Any) {
        let email = emailBox.text
        let password = passBox.text
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            if error == nil {
                self.performSegue(withIdentifier: "toHome", sender: nil)
                
            } else {
                
                //Tells the user that there is an error and then gets firebase to tell them the error
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
            
        }
        
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
