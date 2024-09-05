//
//  MockCMMotionManager.swift
//  MotionTests
//
//  Created by Simon Hopkin on 05/09/2024.
//

import Foundation
import CoreMotion

@testable import Motion

struct MockCMMotionManager : CMMotionManagerProtocol {
    func startDeviceMotionUpdates(to queue: OperationQueue, withHandler handler: @escaping CMDeviceMotionHandler) {
        handler(nil, nil)
    }
    
    func stopDeviceMotionUpdates() {
        
    }
    
    var deviceMotionUpdateInterval: TimeInterval = 0.1
    let isDeviceMotionAvailable: Bool
}
