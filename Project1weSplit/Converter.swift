//
//  Converter.swift
//  Project1weSplit
//
//  Created by karmaln technology on 14/10/21.
//

import SwiftUI

struct Converter: View {
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    @State private var fromSelectedUnit = ""
    @State private var toSelectedUnit = ""

    var units = ["Year", "Months", "Day", "Minutes"]

//    var Convert:Double{
//        let fromUnit = Double(inputUnit) ?? 0
//        if(fromSelectedUnit == units[0] && ){
//            return ""
//        }
//        return Ans
//    }

    func ansReturn() {
        let fromUnit = Double(inputUnit) ?? 0
        if toSelectedUnit == "" { toSelectedUnit = "Day" }

        switch fromSelectedUnit {
        case units[0]:
            switch toSelectedUnit {
            case units[0]:
                outputUnit = String(fromUnit * 1)
                break
            case units[1]:
                outputUnit = String(fromUnit * 12)
                break
            case units[2]:
                outputUnit = String(fromUnit * 365)
                break
            case units[3]:
                outputUnit = String(fromUnit * 525960)
                break
            default:
                break
            }
            break
        case units[1]:
            switch toSelectedUnit {
            case units[0]:
                outputUnit = String(fromUnit * 0.0833333333)
                break
            case units[1]:
                outputUnit = String(fromUnit * 1)
                break
            case units[2]:
                outputUnit = String(fromUnit * 30)
                break
            case units[3]:
                outputUnit = String(fromUnit * 43830)
                break
            default:
                break
            }
            break
        case units[2]:
            switch toSelectedUnit {
            case units[0]:
                outputUnit = String(fromUnit * 0.002)
                break
            case units[1]:
                outputUnit = String(fromUnit * 0.032)
                break
            case units[2]:
                outputUnit = String(fromUnit * 1)
                break
            case units[3]:
                outputUnit = String(fromUnit * 1440)
                break
            default:
                break
            }
            break
        case units[3]:
            switch toSelectedUnit {
            case units[0]:
                outputUnit = String(fromUnit * 1)
                break
            case units[1]:
                outputUnit = String(fromUnit * 12)
                break
            case units[2]:
                outputUnit = String(fromUnit * 365)
                break
            case units[3]:
                outputUnit = String(fromUnit * 525960)
                break
            default:
                break
            }
            break
        default:
            break
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Enter Units You Want to convet").padding(.all)
                    TextField("Enter Unit", text: $inputUnit).padding(.all)
                    HStack(alignment: .top, spacing: 0.0) {
                        // From List
                        Menu {
                            ForEach(0 ..< units.count) { item in
                                Button(action: {
                                    fromSelectedUnit = units[item]
                                    ansReturn()
                                }, label: {
                                    Text("\(units[item])")
                                    Image(systemName: "arrow.down.right.circle")
                                })
                            }
                        } label: {
                            Text(fromSelectedUnit == "" ? "From" : fromSelectedUnit)
                            Image(systemName: "tag.circle")
                        }
                        .padding( .all)
                        .frame(maxWidth: .infinity)

                        // To List

                        Menu {
                            ForEach(0 ..< units.count) { item in
                                Button(action: {
                                    toSelectedUnit = units[item]
                                    ansReturn()
                                }, label: {
                                    Text("\(units[item])")
                                    Image(systemName: "arrow.down.right.circle")
                                })
                            }
                        } label: {
                            Text(toSelectedUnit == "" ? "To" : toSelectedUnit)

                            Image(systemName: "tag.circle")
                        }
                        .padding( .all)
                        .frame(maxWidth: .infinity)
                    }
                    HStack {
                        Text(inputUnit == "" ? "0.00" : inputUnit)
                            .padding( .all)
                            .frame(maxWidth: .infinity)
                        Text(outputUnit == "" ? "0.00" : outputUnit)
                            .padding( .all)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Unit Conveter")
        }
    }
}

struct Converter_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Converter()
            Converter()
        }
    }
}
