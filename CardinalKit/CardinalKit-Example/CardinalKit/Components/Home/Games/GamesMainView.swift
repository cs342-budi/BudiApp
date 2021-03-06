//
//  GamesMainView.swift
//  CardinalKit_Example
//
//  Created by Taylor  Lallas on 2/7/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI
import UIKit

struct GamesMainView: View {
    @State private var showingTapGame = false
    @State private var showingNineHole = false
    @State private var showingTrailMakingTask = false
    @State private var showingReactionTime = false
    
    var body: some View {


            VStack {
                HStack {
                    Button (action:{
                        showingNineHole.toggle()
                    }) {
                        Text("9-HOLE PEG")
                            .fontWeight(.heavy)
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.top, Metrics.PADDING_VERTICAL_MAIN*2.5)
                    .padding(.bottom, Metrics.PADDING_VERTICAL_MAIN*2.5)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .fullScreenCover(isPresented: $showingNineHole) {
                        NineHoleViewController()
                    }
                    
                }.padding()
                    .navigationBarTitle("Games")
                
                HStack {
                    Button (action:{
                        showingTapGame.toggle()
                    }) {
                        Text("QUICK TAP")
                            .fontWeight(.heavy)
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.top, Metrics.PADDING_VERTICAL_MAIN*2.5)
                    .padding(.bottom, Metrics.PADDING_VERTICAL_MAIN*2.5)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .fullScreenCover(isPresented: $showingTapGame) {
                        ActiveTaskViewController()
                    }
                }.padding()
        
//                HStack {
//                    Button (action:{
//                        showingReactionTime.toggle()
//                    }) {
//                        Text("REACTION TIME")
//                            .fontWeight(.heavy)
//                            .font(.title)
//                            .foregroundColor(Color.white)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .padding(.top, Metrics.PADDING_VERTICAL_MAIN*2.5)
//                    .padding(.bottom, Metrics.PADDING_VERTICAL_MAIN*2.5)
//                    .background(Color.yellow)
//                    .cornerRadius(10)
//                    .fullScreenCover(isPresented: $showingReactionTime) {
//                        ReactionTimeViewController()
//                    }
//                }.padding()
                
                HStack {
                    Button (action:{
                        showingTrailMakingTask.toggle()
                    }) {
                        Text("TRAIL MAKING TASK")
                            .fontWeight(.heavy)
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.top, Metrics.PADDING_VERTICAL_MAIN*2.5)
                    .padding(.bottom, Metrics.PADDING_VERTICAL_MAIN*2.5)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .fullScreenCover(isPresented: $showingTrailMakingTask) {
                        TrailMakingTaskViewController()
                    }
                }.padding()
                   
            
                Spacer()
            }
    }
}

struct GamesMainView_Previews: PreviewProvider {
    static var previews: some View {
        GamesMainView()
    }
}
