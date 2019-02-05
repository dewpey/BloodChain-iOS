//
//  ScannerViewController.swift
//  BloodChain
//
//  Created by Drew Patel on 6/12/16.
//  Copyright © 2016 Cloudgration. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftyUserDefaults

protocol MyProtocol {
    func setResultOfBusinessLogic(valueSent: String)
}

class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var toBeSent = ""
    @IBOutlet weak var captureView: UIView!
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureView.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        
        let videoCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice!)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed();
            return;
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.ean8, AVMetadataObject.ObjectType.ean13, AVMetadataObject.ObjectType.pdf417]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession);
        previewLayer.frame = captureView.layer.bounds;
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill;
        captureView.layer.addSublayer(previewLayer);
        
        captureSession.startRunning();
    }
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
        captureSession = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.isRunning == false) {
            captureSession.startRunning();
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning();
        }
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            let readableObject = metadataObject as! AVMetadataMachineReadableCodeObject;
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            //print(readableObject.stringValue);
            toBeSent = readableObject.stringValue!;
            let defaults = UserDefaults.standard
            defaults.set("bloodID", forKey: toBeSent)
            let bloodKey = DefaultsKey<String>("bloodID")
            defaults[bloodKey] = toBeSent
            
            performSegue(withIdentifier: "toData", sender: nil)
            
        }

        

        
        //dismissViewControllerAnimated(true, completion: nil)
        //navigationController?.popViewController(animated: true)
        
        //dismiss(animated: true, completion: nil)
        
    }
    
    
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return .portrait
    }
    @IBAction func backButtonPress(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

        //            toViewController.bloodID = toBeSent
            //        }
        
    //    if(segue.identifier == "toData") {
    //
    //        if let toViewController = segue.destination as? BloodDataViewController {
    //            toViewController.bloodID = toBeSent
    //        }
    //   }

    }

    
    
}
