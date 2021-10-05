//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Russell Gordon on 2021-09-30.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    // Create an empty list to keep track of predictions made
    @Published var history: [Prediction] = []

    init() {
        // Generate several predictions
        for _ in 1...3 {
            _ = self.providePrediction()
        }
    }
    // Give a predicction
    func providePrediction() -> Prediction {
        
        // Generate a weather prediction
        let prediction = WeatherPredictionGenerator.getPrediction()

        // Save the prediction
        history.append(prediction)

        // Return the prediction
        return prediction
        
    }
    
}
