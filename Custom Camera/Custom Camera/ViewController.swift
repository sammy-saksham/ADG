//
//  ViewController.swift
//  Custom Camera
//
//  Created by Saksham Jain on 03/03/20.
//  Copyright © 2020 Saksham Jain. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let captureSession = AVCaptureSession()
    var previewLayer: CALayer!
    
    var captureDevice: AVCaptureDevice!
    
    var takePhoto = false

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCamera()
    }
    
    override func viewDidAppear( _ animated: Bool){
        super.viewWillAppear(animated)
        prepareCamera()
    }

    func prepareCamera(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes:[.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices
        
            captureDevice = availableDevices.first
            beginSession()
        
    }
        
        func beginSession(){
            do{
                let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
                
                captureSession.addInput(captureDeviceInput)
            }catch{
                print(error.localizedDescription)
            }
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                self.previewLayer = previewLayer
                self.view.layer.addSublayer(self.previewLayer)
                self.previewLayer.frame = self.view.layer.frame
                captureSession.startRunning()
                
                let dataOutput = AVCaptureVideoDataOutput()
                dataOutput.videoSettings = [((kCVPixelBufferPixelFormatTypeKey as NSString) as String): NSNumber(value: kCVPixelFormatType_32BGRA)]
                
                dataOutput.alwaysDiscardsLateVideoFrames = true
                
                if captureSession.canAddOutput(dataOutput){
                    captureSession.commitConfiguration()
                }
                
                captureSession.commitConfiguration()
                
                let queue = DispatchQueue(label: "com.SakshamJain.captureQueue")
                dataOutput.setSampleBufferDelegate(self, queue:
                queue)
            
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        takePhoto = true
        
        if let image = self.getImageFromSampleBuffer(buffer: sampleBuffer){
            let photoVC = UIStoryboard(name: "main", bundle: nil).instantiateInitialViewController(widthIdentifier: "PhotoVC") as! PhotoViewController
            photoVC.takenPhoto = image
            DispatchQueue.main.async {
                self.present(photoVC, animated: true, completion: {self.stopCaptureSession()})
            }
        }
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection!) {
        if takePhoto{
            takePhoto=false
        }
    }
    
    func getImageFromSampleBuffer(buffer: CMSampleBuffer){
        if let pixelBuffer = CMSampleBufferGetDataBuffer(buffer){
            let ciImage = CIImage(cvPixelBuffer: pixelBuffer as! CVPixelBuffer)
            let context = CIContext()
            
            let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixelBuffer as! CVPixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer as! CVPixelBuffer))
            if let image = context.createCGImage(ciImage, from: imageRect){
                return UIImage(cgImage: image, scale: UIScreen.main.scale, orientation: .right)
            }
        }
    }
    func stopCaptureSession(){
        self.captureSession.stopRunning()
        
        if let inputs = captureSession.inputs as?[AVCaptureDeviceInput]{
            for input in inputs{
                self.captureSession.removeInput(input)
            }
        }
    }
    
}
