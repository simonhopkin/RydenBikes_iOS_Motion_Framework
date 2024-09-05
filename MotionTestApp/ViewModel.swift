//
//  ViewModel.swift
//  MotionTestApp
//
//  Created by Simon Hopkin on 05/09/2024.
//

import Foundation
import Motion

@Observable
class ViewModel {
    
    var receivingDeviceOrientationUpdates: Bool = false
    var pitch: Double?
    var roll: Double?
    var yaw: Double?
    
    let motionManager: MotionManagerProtocol

    init(motionManager: MotionManagerProtocol) {
        self.motionManager = motionManager
    }
    
    func toggleAngleUpdates() {
        receivingDeviceOrientationUpdates ? stopAngleUpdates() : startAngleUpdates()
    }
    
    private func startAngleUpdates() {
        do {
            try motionManager.startDeviceOrientationUpdates { pitch, roll, yaw in
                print("ViewModel -- startDeviceAngleUpdates: \(pitch), \(roll), \(yaw)")
                self.pitch = pitch
                self.roll = roll
                self.yaw = yaw
            }
            receivingDeviceOrientationUpdates = true
        }
        catch {
            print("ViewModel -- ERROR: \(error)")
        }
    }
    
    private func stopAngleUpdates() {
        motionManager.stopDeviceOrientationUpdates()
        receivingDeviceOrientationUpdates = false
    }
}
