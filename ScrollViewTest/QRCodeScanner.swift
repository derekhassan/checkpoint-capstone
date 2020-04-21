import UIKit
import AVFoundation
import SwiftyJSON

let qrCodeScannerKey = "qr"

struct defaultsKeys {
    static let keyOne = "id"
   
}

var QRSc = QRCodeScanner()
class QRCodeScanner: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var shareString:String = ""

    @IBOutlet weak var cameraFrameSize: UIView!
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var qrCodeFrameView:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)

            DispatchQueue.main.async {
                var qrCodeFrameView = UIView()
                qrCodeFrameView = UIView(frame: CGRect(x:60, y:150, width:250, height:250))
                self.view.addSubview(qrCodeFrameView)
                self.qrCodeFrameView = UIView()
                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                qrCodeFrameView.bringSubviewToFront(qrCodeFrameView)
 
            }
        
            //qrCodeFrameView = UIView()
            //if let qrCodeFrameView = qrCodeFrameView {
              //            qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                //        qrCodeFrameView.layer.borderWidth = 2
                  //    view.bringSubviewToFront(qrCodeFrameView)
                
                    //   }
           
        } catch  {
            return
        }

        if (captureSession.canAddInput(videoInput)) {

            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let size = 300
        let screenWidth = self.view.frame.size.width
        let xPos = (CGFloat(screenWidth) / CGFloat(2)) - (CGFloat(size) / CGFloat(2))
        let scanRect = CGRect(x: Int(xPos), y: 150, width: size, height: size)
        
        func convertRectOfInterest(rect: CGRect) -> CGRect {
            let screenRect = self.view.frame
            let screenWidth = screenRect.width
            let screenHeight = screenRect.height
            let newX = 1 / (screenWidth / rect.minX)
            let newY = 1 / (screenHeight / rect.minY)
            let newWidth = 1 / (screenWidth / rect.width)
            let newHeight = 1 / (screenHeight / rect.height)
            return CGRect(x: newY, y: newX, width: newHeight, height: newWidth)
            
        }

        let metadataOutput = AVCaptureMetadataOutput()
        metadataOutput.rectOfInterest = convertRectOfInterest(rect: scanRect)

        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]

        } else {
            failed()
            return
        }

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = CGRect(x: 0, y: view.bounds.height - cameraFrameSize.bounds.height , width: cameraFrameSize.bounds.width, height: cameraFrameSize.bounds.height)
        previewLayer.videoGravity = .resizeAspectFill
        //
        previewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(previewLayer)

        captureSession.startRunning()
    }

    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()

        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else
            
            { return }
           AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)

            let barCodeObject = previewLayer!.transformedMetadataObject(for: metadataObject as! AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
             
            qrCodeFrameView?.frame = barCodeObject.bounds
        }
    }

    func downloadJSON(code: String)  {

      if let url = URL(string: code){
        if !code.isEmpty && url.absoluteString.range(of: Routes.couponRoute) != nil  {return  URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data
                    {
                        do {
                            
                            let res = try JSONDecoder().decode(Reponse.self, from: data)
                            print(res.id)
                            print(res.bus_id)
                            print(res.percentage_cap)
                            print(res.percentage)
                            let couponID = String(res.id)
                            let busID = String(res.bus_id)
                            let percentageCap = String(res.percentage_cap)
                            let percentage = String(res.percentage)
                            
                            //NotificationCenter added for passing coupon data into function that creates new card
                            let name = Notification.Name(rawValue: qrCodeScannerKey)
                            NotificationCenter.default.post(name: name, object: ["Qrid:" + couponID, "BusID:" + busID, "Cap:" + percentageCap, "Percentage:" + percentage])
                            
                            // Setting

                            let defaults = UserDefaults.standard //Creates local storage instance of coupon ID
                            defaults.set(couponID, forKey: defaultsKeys.keyOne)

                            // Getting
                            
                            if let stringOne = defaults.string(forKey: defaultsKeys.keyOne) {//Retrieves coupon ID from local storage
                                print(stringOne)
                            }
                        }
                            
                         catch {let err2 = UIAlertController(title: "Sorry", message: "Not a compatible QR code", preferredStyle: .alert)
                              err2.addAction(UIAlertAction(title: "Retake", style: .default, handler: { (action) in

                                  self.captureSession.startRunning()
                                  self.dismiss(animated: true, completion: nil)
                              }))
                            
                              self.present(err2, animated: true, completion: nil)
                            
                                }
                        }
                
                }.resume()
                
        }
        
        self.shareString = (code)
        
            //if JSON is empty
            if code.isEmpty {
                let err3 = UIAlertController(title: "Whoops", message: "No JSON", preferredStyle: .alert)
                  err3.addAction(UIAlertAction(title: "Retake", style: .default, handler: { (action) in
                      self.captureSession.startRunning()
                      self.dismiss(animated: true, completion: nil)
                  }))
                
                  self.present(err3, animated: true, completion: nil)
            }
            //checks to see if QR code is scannable
            if url != URL(string: Routes.couponRoute) {
                print("Not a valid code")
         
                  let err2 = UIAlertController(title: "Sorry", message: "Not a compatible QR code", preferredStyle: .alert)
                  err2.addAction(UIAlertAction(title: "Retake", style: .default, handler: { (action) in
                      self.captureSession.startRunning()
                      self.dismiss(animated: true, completion: nil)
                  }))
                
                  self.present(err2, animated: true, completion: nil)
                
              }
        }
      else if !code.isEmpty { //need to add more logic here to error check. The response should be formatted as such: user_id: 1, coupon_id: 2
            print(code) //for test
        if let data = code.data(using: .utf8) {
            do {
                let json = try JSON(data: data)
                
                if json["user_id"].exists() {
                    
                    print("Should be valid")
                    //checkpoint.test/api/auth/createtransaction?userShared=1&userReceived=2&couponID=1
                }
            } catch {
                print("JSON error, need to look into")
            }
            

        }
        else {
            print("Error in converting code to data type")
        }
      }
    }

    //function for incompatible QR code
    func BadQR(code: String){
    
         let err2 = UIAlertController(title: "Sorry", message: "Not a compatible QR code", preferredStyle: .alert)
                         err2.addAction(UIAlertAction(title: "Retake", style: .default, handler: { (action) in
                             self.captureSession.startRunning()
                             self.dismiss(animated: true, completion: nil)
                         }))
                       
                         self.present(err2, animated: true, completion: nil)
    }

    //brings up UI prompt after successful scan
    func found(code: String) {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Coupon Scanned", message: code, preferredStyle: .alert)
            
            //Action to retake QR code
            alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: { (action) in
                self.captureSession.startRunning()
                //self.dismiss(animated: true, completion: nil)
            }))

            //Action to add scanned coupon to wallet
            alert.addAction(UIAlertAction(title: "Add to Wallet", style: .default, handler: { (action) in
                            UIPasteboard.general.string = code
                            self.captureSession.startRunning()
                            self.downloadJSON(code: code)
            }))

            self.present(alert, animated: true, completion: nil)
            print(code)
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
    
