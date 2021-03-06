//
//  ViewInstructionsButton.swift
//  CardinalKit_Example
//
//  Created by Taylor  Lallas on 3/5/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI

struct ViewInstructionsButton: View {
    @State private var showingTherapyVideos = false
    @State var exerciseCount = 0
    
    
    let color: Color
    let config = CKPropertyReader(file: "CKConfiguration")
    
    var onComplete: (() -> Void)? = nil
    
    init(onComplete: (() -> Void)? = nil) {
        self.color = Color(config.readColor(query: "Primary Color"))
    }
    
    var body: some View {
        Button(action: {
            self.showingTherapyVideos.toggle()
        }) {
            HStack(alignment: .center) {
                Text("VIEW EXERCISES")
                    .fontWeight(.heavy)
                    .font(.title2)
                    .foregroundColor(Color.white)
               
            }
            .frame(maxWidth: 250)
            .padding(Metrics.PADDING_VERTICAL_MAIN*2)
            .background(Color.gray)
            .cornerRadius(10)
            .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN * 2.5)
            .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN * 2.5)
 
            
        }.sheet(isPresented: $showingTherapyVideos) {
            TherapyInstructionsView()
    }
    }
}

struct ViewInstructionsButton_Previews: PreviewProvider {
    static var previews: some View {
        ViewInstructionsButton()
    }
}
