//
//  ContentView.swift
//  SplitTab
//
//  Created by OD Orafidiya on 4/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.00
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 0.20
    let tipPercentages = [0.15, 0.18, 0.20, 0.25, 0.30]
    
    private var tipValue: Double {
        let tipValue = checkAmount * tipPercentage
        return tipValue
    }
    private var grandTotal: Double {
        let total = checkAmount + tipValue
        return total
    }
    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 1)
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(0..<100) {
                            Text("\($0 + 1) people ")
                        }
                    }
                }
                .pickerStyle(.navigationLink)
                
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Tip Amount") {
                    Text(tipValue, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Grand Total") {
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Total Amount per Person (including tip)") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                
                
            }
            .navigationTitle("SplitTab")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
