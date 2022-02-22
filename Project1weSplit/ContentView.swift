//
//  ContentView.swift
//  Project1weSplit
//
//  Created by karmaln technology on 12/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    @State private var name = ""
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    @State private var tipPercentages = [5, 10, 15, 20, 30, 0]

    var totalAmountPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }

    var totalBill: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let perPersonBill = totalAmountPerPerson
        return perPersonBill * peopleCount
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter Your Name", text: $name)
                        .padding(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
                    Text("Hello, \(name)").padding()

                    TextField("Amount", text: $checkAmount)
                        .padding(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)

                    Picker("Number of People ", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) People")
                        }
                    }
                    .padding(.all)

                    VStack(alignment: .leading) {
                        Text("How Much Tip You Want To Leave")
                            .padding(.all)
                        Picker("Tip Percentage", selection: $tipPercentage) {
                            ForEach(0 ..< tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.all)
                    }

                    Text("Total Bill Per Person : \(totalAmountPerPerson, specifier: "%.2f")")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.purple)
                        .padding(.all)

                    Text("Total Bill You Have To Pay : \(totalBill, specifier: "%.2f")")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.green)
                        .padding(.all)
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
