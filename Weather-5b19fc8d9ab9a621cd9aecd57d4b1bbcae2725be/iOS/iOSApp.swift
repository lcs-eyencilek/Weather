//
//  iOSApp.swift
//  iOS
//
//  Created by Russell Gordon on 2021-10-02.
//

import SwiftUI

@main
struct iOSApp: App {
    
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            TabView {
                
                NavigationView {
                    // Last element inside the history of predictions
                    let lastPrediction = viewModel.history.last!
                    // Call site (where you create an instance of something if you are calling the initializer)
                    ContentView(
                        viewModel: viewModel,
                        temperature: lastPrediction.temperature,
                        feel: lastPrediction.feel,
                        conditions: lastPrediction.condition.description
                        )
                }
                .tabItem {
                    Image(systemName: "sun.haze.fill")
                    Text("Current")
                }

                NavigationView {
                    HistoryView(viewModel: viewModel)
                }
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }

            }
            
        }
    }
}
