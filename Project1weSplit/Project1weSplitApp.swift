//
//  Project1weSplitApp.swift
//  Project1weSplit
//
//  Created by karmaln technology on 12/10/21.
//

import SwiftUI

@main
struct Project1weSplitApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                .tabItem {
                    Image(systemName: "dollarsign.circle.fill")
                    Text("Split Bill")
                }

                Converter()
                .tabItem {
                    Image(systemName: "move.3d")
                    Text("Converter")
                }
            }
        }
    }
}
