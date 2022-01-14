//
//  ContentView.swift
//  BetterRest
//
//  Created by Samuel Ebuka on 29/12/21.
//
import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 7.0
    @State private var coffeAmount = 2
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
        
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section {
            
                    HStack {
                        Spacer()
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                } header: {
                    Text("A que hora te quieres despertar")
                }
              
                
            
               
                Text("Cuántas horas quieres dormir?")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted()) horas", value: $sleepAmount, in: 4...12, step: 0.50)
                
                Text("Cuánto café tomas?")
                    .font(.headline)
                
                Stepper(coffeAmount == 1 ? "1 taza" : "\(coffeAmount) tazas", value: $coffeAmount, in: 1...20 )
            }
            .navigationTitle("Descansas??")
            .toolbar {
                Button("Calcular", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showAlert){
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            // mreo
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Deberías irte a dormir a las.."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
            
            
            
        } catch {
            //something wrong
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculation your bedtime"
        }
        
        showAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
