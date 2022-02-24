//
//  CMMotionManager.swift
//  BUDI WatchKit Extension
//
//  Created by Tracy Cai on 1/26/22.
//

import Foundation
import HealthKit
import CoreMotion


//provide updated data to views
class CoreMotionManager: NSObject, ObservableObject {
    @Published var accelaration: Double = 0.0
    @Published var acclerationHistory: [Double] = [10.0, 20.0, 30.0]
    var meanAccelaration: Double = 0.0
    var motion: CMMotionManager!
    //var timer: Timer?
    var accelArray : [Double] = []
    var maxArray : [Double] = []
    
    fileprivate lazy var motionQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.qualityOfService = .userInitiated
        queue.maxConcurrentOperationCount = 9
        return queue
    }()
  
    
    override init(){
        super.init()
        print("CMmanager init")
        self.motion = CMMotionManager()
    }
    
    func getMeanAccelaration(){
        meanAccelaration = acclerationHistory.reduce(0,+)/Double(acclerationHistory.count)
    }
    
    func startAccelerometers() {
        
        self.accelaration += 1
       // Make sure the accelerometer hardware is available.

      print("INSIDE START ACCEL")
        
        
        //MARK: Testing arbitrary data
        if SendDataToPhone.shared.session.isReachable {
            //send data to phone
            print("TESTING ARBITRARY DATA ")
            SendDataToPhone.shared.session.sendMessage(["data": 666], replyHandler: nil, errorHandler: { (err) in print (err.localizedDescription)})
    }
       
        if self.motion.isDeviceMotionAvailable {
            print("MOTION AVAILABLE")
            self.motion.deviceMotionUpdateInterval = 1.0/60.0
            self.motion.startDeviceMotionUpdates(to: motionQueue, withHandler: { [weak self] (data: CMDeviceMotion?, error: Error?) in
                if let data = data  {
                        let xVal = data.userAcceleration.x
                        self?.accelArray.append(xVal)
                        print("THIS IS THE XVAL \(xVal)")
                        if self?.accelArray.count ?? 0 > 300 { //60 * 5
                            if let max = self?.accelArray.max() {
                                self?.maxArray.append(max)
                                self?.accelaration = max
                                
                                    if SendDataToPhone.shared.session.isReachable {
                                        //send data to phone
                                        print("SENDING MAX TO PHONE")
                                        SendDataToPhone.shared.session.sendMessage(["data": max], replyHandler: nil, errorHandler: { (err) in print (err.localizedDescription)})
                                }
                            }
                        }
                    }
                })
        } else {
            print("motion not available :(")
        }
        
        
    
//
//       if self.motion.isAccelerometerAvailable {
//          self.motion.accelerometerUpdateInterval = 1.0 / 60.0  // 60 Hz
//          self.motion.startAccelerometerUpdates()
//           print("start")
//
////          // Configure a timer to fetch the data.
////          self.timer = Timer(fire: Date(), interval: (1.0/60.0),
////                repeats: true, block: { (timer) in
////             // Get the accelerometer data.
////              print("inside timer")
//             if let data = self.motion.accelerometerData {
//                let x = data.acceleration.x
////                let y = data.acceleration.y
////                let z = data.acceleration.z
////
////                // Use the accelerometer data in your app.
//                print("inside if")
//                acclerationHistory.append(x)
//                self.accelaration = x
//
//
//                 if SendDataToPhone.shared.session.isReachable {
//                     //send data to phone
//                     print("SENDING DATA TO PHONE")
//                     SendDataToPhone.shared.session.sendMessage(["data": self.accelaration], replyHandler: nil, errorHandler: { (err) in print (err.localizedDescription)})
//             }
//
//             }
////          })
//
//          // Add the timer to the current run loop.
////           RunLoop.current.add(self.timer!, forMode: .default)
//       }
    }

}


