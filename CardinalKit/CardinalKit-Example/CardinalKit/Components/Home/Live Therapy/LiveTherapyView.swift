//
//  LiveTherapyView.swift
//  CardinalKit_Example
//
//  Created by Taylor  Lallas on 2/7/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI
import CareKitStore
import CareKit
import Charts

struct LiveTherapyView: View {
    
    @ObservedObject var watchViewModel = WatchViewModel()
    
    var body: some View {
        // 1
        VStack{
            Text("My Live Therapy Tracker")
                .fontWeight(.heavy)
                .font(.title2)
                .foregroundColor(Color.black)
            
            Spacer()
            
            /*
            Text(watchViewModel.data).onReceive($watchViewModel.actionNotification){ action in
                // MARK: Taylor
                // We subscribe to *actionNotification* from the viewModel to listen for a notification
                // then based on the message we got, we either start or stop the therapy session.
                
                switch action {
                    case "data":
                        print("this is the change " + watchViewModel.data)
                    default:
                        return
                }
                
            }*/

            
            Text("This is the data: \(watchViewModel.data)")

            LiveTherapyChartView(entries: [
                //x - position of a bar, y - height of a bar
                BarChartDataEntry(x: 1, y: 1),
                BarChartDataEntry(x: 2, y: 2),
                BarChartDataEntry(x: 3, y: 3),
                BarChartDataEntry(x: 4, y: 4),
                BarChartDataEntry(x: 5, y: 1),
                BarChartDataEntry(x: 6, y: 2),
            ])
                
                .padding(.top, 20 )
                .padding(.leading, 50)
                .overlay(Text("Acceleration")
                .font(.system(size: 15))
                .fontWeight(.medium)
                .rotationEffect(.degrees(270))
                .offset(x: -10.0, y: 0.0),
                alignment: .leading)
                .overlay(Text("Time (seconds)")
                .font(.system(size: 15))
                .fontWeight(.medium)
                .offset(x: 10.0, y: 0.0),
                alignment: .top)
            
            Text(watchViewModel.messageText)

                .font(.system(size: 50))
                .bold()
            
            Button (action:{
                // MARK: TAYLOR
                // check if the watch is reachable
                if self.watchViewModel.session.isReachable {
                // send a message to the watch to stop the therapy session
                    self.watchViewModel.session.sendMessage(["action": "THERAPY_STOP"], replyHandler: nil, errorHandler: { (err) in
                        print(err.localizedDescription)
                    })
                }
                
            }) {
                Text("STOP THERAPY")
                    .fontWeight(.heavy)
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .padding()
            .padding(.top, Metrics.PADDING_VERTICAL_MAIN*2.5)
            .padding(.bottom, Metrics.PADDING_VERTICAL_MAIN*2.5)
            .background(Color.red)
            .cornerRadius(10)
            
            Spacer()
        }
    }
}

