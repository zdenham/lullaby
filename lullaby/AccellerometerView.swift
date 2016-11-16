//
//  AccellerometerView.swift
//  lullaby
//
//  Created by Zachary Denham on 11/15/16.
//  Copyright © 2016 scope. All rights reserved.
//

import UIKit
import CoreMotion

class AccellerometerView: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var xOutput: UILabel!
    @IBOutlet weak var yOutput: UILabel!
    @IBOutlet weak var zOutput: UILabel!
    @IBOutlet weak var endButton: UIButton!
    var motionManager: CMMotionManager!
    var moveData: [[Double]] = []
    var distance: Double = 0.0
    var time: Double = 0.0
    var frequency = 0.1
    
    @IBAction func endButtonPressed(_ sender: Any) {
        endMeasuring()
    }
    
    @IBAction func startButton(_ sender: Any) {
        startMeasuring()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager = CMMotionManager()
        motionManager.accelerometerUpdateInterval = frequency
    }
    
    func endMeasuring() {
        motionManager.stopAccelerometerUpdates()
        if(!moveData.isEmpty){
            moveData.removeAll()
        }
        
        for j in moveData {
            for i in j {
                print( i )
            }
        }
        
        distance = 0
        time = 0.0

    }
    
    func startMeasuring(){
        
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (accelerometerData: CMAccelerometerData?, NSError) -> Void in
        
            self.outputAcceleration(acceleration: accelerometerData!.acceleration)
            if(NSError != nil) {
                print("\(NSError)")
            }
        }

    }
    
    func outputAcceleration(acceleration: CMAcceleration) {
        let temp = roundArray(myArray: [acceleration.x, acceleration.y, acceleration.z])
        moveData.append(temp)
        xOutput.text = String(temp[0])
        yOutput.text = String(temp[1])
        zOutput.text = String(temp[2])
        time+=frequency
        timeLabel.text = String(time)
    }
    
    func roundArray(myArray: [Double]) -> [Double] {
        let a = Double(round(10*myArray[0])/10)
        let b = Double(round(10*myArray[1])/10)
        let c = Double(round(10*myArray[2])/10)
        return [a, b, c]
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}
