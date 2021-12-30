//
//  WorkingDates.swift
//  BetterRest
//
//  Created by Samuel Ebuka on 29/12/21.
//

import SwiftUI

struct WorkingDates: View {
    var body: some View {
        Text(Date.now, format: .dateTime.month().day().hour().minute())
    }
    
    func trivialExample(){
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        
        let momento = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hora = momento.hour ?? 0
        let minuto = momento.minute ?? 0
        
        let date = Calendar.current.date(from: components) ?? Date.now
        print(date)
    }
}

struct WorkingDates_Previews: PreviewProvider {
    static var previews: some View {
        WorkingDates()
    }
}
