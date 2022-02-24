/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The workout metrics view.
*/

import SwiftUI
import HealthKit
import CoreMotion
var highestAccelaration = 0
struct MetricsView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @EnvironmentObject var cmMotionManager: CoreMotionManager
//    @ObservedObject var manager = CoreMotionManager()
    
    var body: some View {
        TimelineView(MetricsTimelineSchedule(from: workoutManager.builder?.startDate ?? Date())) { context in
            VStack(alignment: .leading) {
                ElapsedTimeView(elapsedTime: workoutManager.builder?.elapsedTime ?? 0, showSubseconds: context.cadence == .live)
                    .foregroundStyle(.yellow)
                Text(Measurement(value: workoutManager.activeEnergy, unit: UnitEnergy.kilocalories)
                        .formatted(.measurement(width: .abbreviated, usage: .workout, numberFormatStyle: .number.precision(.fractionLength(0))))).foregroundColor(.red)
                Text(workoutManager.heartRate.formatted(.number.precision(.fractionLength(0))) + " bpm").foregroundColor(.mint)
                Text(cmMotionManager.accelaration.formatted(.number.precision(.fractionLength(0)))+" cm/s").foregroundColor(.purple)+Text("2").font(.system(.footnote)).baselineOffset(10).foregroundColor(.purple)
//                Text(Measurement(value: workoutManager.distance, unit: UnitLength.meters).formatted(.measurement(width: .abbreviated, usage: .road)))
            }
            .font(.system(.title, design: .rounded).monospacedDigit().lowercaseSmallCaps())
            .frame(maxWidth: .infinity, alignment: .leading)
            .ignoresSafeArea(edges: .bottom)
            .scenePadding()
            .background(Color.gray)
        }
    }
}

//struct MetricsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MetricsView().environmentObject(WorkoutManager())
//    }
//}

private struct MetricsTimelineSchedule: TimelineSchedule {
    var startDate: Date

    init(from startDate: Date) {
        self.startDate = startDate
    }

    func entries(from startDate: Date, mode: TimelineScheduleMode) -> PeriodicTimelineSchedule.Entries {
        PeriodicTimelineSchedule(from: self.startDate, by: (mode == .lowFrequency ? 1.0 : 1.0 / 30.0))
            .entries(from: startDate, mode: mode)
    }
}

