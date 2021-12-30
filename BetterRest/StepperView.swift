//
//  StepperView.swift
//  BetterRest
//
//  Created by Samuel Ebuka on 29/12/21.
//

import SwiftUI

struct StepperView: View {
    @State private var sleepAmount: Double = 8
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            .padding()
    }
}



struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView()
    }
}
