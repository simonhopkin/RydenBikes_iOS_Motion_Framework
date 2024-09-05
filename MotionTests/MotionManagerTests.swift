//
//  MotionManagerTests.swift
//  MotionTests
//
//  Created by Simon Hopkin on 05/09/2024.
//

import XCTest
import CoreMotion
@testable import Motion

final class MotionManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMotionManagerShouldThrowErrorIfMotionIsNotEnabled() {
        let mockMotionManagerMotionNotAvailalbe = MockCMMotionManager(isDeviceMotionAvailable: false)

        let motionManagerA = MotionManager(motionManager: mockMotionManagerMotionNotAvailalbe)
        
        XCTAssertThrowsError(try motionManagerA.startDeviceOrientationUpdates { _,_,_  in }, "expect motionManager to throw an error when motion is not available on the device") { error in
            XCTAssertNotNil(error as? MotionManagerError)
            XCTAssertEqual(error as? MotionManagerError, MotionManagerError.deviceMotionNotAvailable)
        }
        
        let mockMotionManagerMotionAvailalbe = MockCMMotionManager(isDeviceMotionAvailable: true)

        let motionManagerB = MotionManager(motionManager: mockMotionManagerMotionAvailalbe)
        
        XCTAssertNoThrow(try motionManagerB.startDeviceOrientationUpdates { _,_,_  in }, "expect motionManager to not throw an error when motion is available on the device")
    }
}
