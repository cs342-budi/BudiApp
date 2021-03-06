/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The workout summary view.
*/

import Foundation
import HealthKit
import SwiftUI
import WatchKit
import CoreMotion

struct SummaryView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @EnvironmentObject var cmMotionManager: CoreMotionManager
    @Environment(\.dismiss) var dismiss
    @State private var durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
    //lifecycle method
    
    var body: some View {
//        if workoutManager.workout == nil {
//            ProgressView("Saving Workout")
//                .navigationBarHidden(true)
//        } else {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        SummaryMetricView(title: "Total Time", value: durationFormatter.string(from: workoutManager.workout?.duration ?? 0.0) ?? "")
                           .foregroundStyle(.green)
                    }
                    
//                    SummaryMetricView(title: "Total Distance",
//                                      value: Measurement(value: workoutManager.workout?.totalDistance?.doubleValue(for: .meter()) ?? 0,
//                                                         unit: UnitLength.meters)
//                                        .formatted(.measurement(width: .abbreviated,
//                                                                usage: .road,
//                                                                numberFormatStyle: .number.precision(.fractionLength(2)))))
                        //.foregroundStyle(.green)
                    SummaryMetricView(title: "Points Earned", value: "5").foregroundColor(.green)
                    SummaryMetricView(title: "Total Energy",
                                      value: Measurement(value: workoutManager.workout?.totalEnergyBurned?.doubleValue(for: .kilocalorie()) ?? 0,
                                                         unit: UnitEnergy.kilocalories)
                                        .formatted(.measurement(width: .abbreviated,
                                                                usage: .workout,
                                                                numberFormatStyle: .number.precision(.fractionLength(0)))))
                        .foregroundStyle(.green)
                    SummaryMetricView(title: "Avg. Heart Rate",
                                      value: workoutManager.averageHeartRate.formatted(.number.precision(.fractionLength(0))) + " bpm")
                        .foregroundStyle(.green)
                    
                    
                    
                    // fastest accelaration?
                    //send data back to IOS?
                    
                    
                   // SummaryMetricView(title: "Avg. Accelaration",
                                    //  value: String(cmMotionManager.meanAccelaration.formatted(.number.precision(.significantDigits(2)))))
                    
                        .foregroundStyle(.green)
                    Text("Activity Rings")
                    ActivityRingsView(healthStore: workoutManager.healthStore)
                        .frame(width: 50, height: 50)
                    Button("Done") {
                        dismiss()
                    }
                }
                .scenePadding()
            }
            .navigationTitle("Summary")
            .navigationBarTitleDisplayMode(.inline)
        }
//    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}

struct SummaryMetricView: View {
    var title: String
    var value: String

    var body: some View {
        Text(title)
            .foregroundStyle(.foreground)
        Text(value)
            .font(.system(.title2, design: .rounded).lowercaseSmallCaps())
        Divider()
    }
}

