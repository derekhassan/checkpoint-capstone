//
//  QRCodeScanner.swift
//  ScrollViewTest
//
//  Created by Derek Hassan on 12/3/19.
//  Copyright © 2019 Derek Hassan. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeScanner: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    var video = AVCaptureVideoPreviewLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let session = AVCaptureSession()
        
        let captureDevice = AVCaptureDevice.default(for: .video)
        let input: AVCaptureDeviceInput?
        
        do {
            input = try AVCaptureDeviceInput(device: captureDevice!) //could cause issue without capture device
            if let input = input {
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                
            } else {
                print("Camera is nil!")
            }
        }
        catch {
            print("Something went wrong!")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        //video.frame = view.layer.bounds
        video.frame = CGRect(x: 0, y: view.bounds.height - cameraFrameSize.bounds.height, width: cameraFrameSize.bounds.width, height: cameraFrameSize.bounds.height - 80) //not sure how this looks
        view.layer.addSublayer(video) //may need to change
        
        session.startRunning()
        
    }
    
    func metadataOutput(_ metadataOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
            if metadataObjects != nil && metadataObjects.count != 0 {
                if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                    if object.type == AVMetadataObject.ObjectType.qr {
                        let alert = UIAlertController(title: "QR Code", message: object.stringValue, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                        alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: {(nil) in UIPasteboard.general.string = object.stringValue}))
                        
                        present(alert, animated: true, completion: nil)
                    }
                }
            }
    }
    
    @IBOutlet weak var cameraFrameSize: UIView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
