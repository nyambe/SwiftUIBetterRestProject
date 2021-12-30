//
//  DatesView.swift
//  BetterRest
//
//  Created by Samuel Ebuka on 29/12/21.
//

import SwiftUI

struct DatesView: View {
    @State private var wakeUp = Date.now
    var body: some View {
        DatePicker("Pleae enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
    }
    
//    func exampleDate(){
//        let tomorrow = Date.now.addingTimeInterval(86499)
//        let range = Date.now...tomorrow
//    }
}

struct DatesView_Previews: PreviewProvider {
    static var previews: some View {
        DatesView()
    }
}
