//
//  ContentView.swift
//  MotionTestApp
//
//  Created by Simon Hopkin on 05/09/2024.
//

import SwiftUI
import Motion
import CoreMotion

struct ContentView: View {
    
    @State private var viewModel = ViewModel(motionManager: MotionManager(motionManager: CMMotionManager()))

    var body: some View {
        VStack {
            Button {
                viewModel.toggleAngleUpdates()
            } label: {
                Text(viewModel.receivingDeviceOrientationUpdates ? "Stop Orientation Updates" : "Start Orientation Updates")
            }
            Text("Pitch: \(viewModel.pitch != nil ? String(format: "%.1f", viewModel.pitch!) : "N/A")")
            Text("Roll: \(viewModel.roll != nil ? String(format: "%.1f", viewModel.roll!) : "N/A")")
            Text("Yaw: \(viewModel.yaw != nil ? String(format: "%.1f", viewModel.yaw!) : "N/A")")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
