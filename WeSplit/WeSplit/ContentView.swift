//
//  ContentView.swift
//  WeSplit
//
//  Created by Umut Can Ertürk on 4.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfPeople = 2
    @State private var checkAmount = 0.0
    @State private var tipPercentage = 20
    @FocusState private var amountFocused: Bool
    
    var computedAmount : Double {
        return (checkAmount + (checkAmount / 100 * Double(tipPercentage))) / Double(numberOfPeople)
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .focused($amountFocused)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2...99, id: \.self){
                            Text("\($0) People")}
                    }
                }
                
                Section{
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section{
                    Text(computedAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
                
                Section {
                    Text(computedAmount*Double(numberOfPeople), format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total Amount")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        amountFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
