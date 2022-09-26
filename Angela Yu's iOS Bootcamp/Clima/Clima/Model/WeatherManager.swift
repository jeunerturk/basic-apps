//
//  WeatherManager.swift
//  Clima
//
//  Created by Umut Can Ertürk on 26.09.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3668f8a6ca944938119496293975ec22&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // MARK: Create a Url, Create a URLSession, Give the session a task, Start the task
        if let url = URL(string: urlString) {
            
            let session =  URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let  safeData = data {
                    parseJSON(jsonData: safeData)
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(jsonData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: jsonData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, temperature: temp, cityName: name)
            
            print(weather.conditionName)
            print(weather.temperatureString)
            print(temp)
            
        } catch {
            print(error)
        }
    }
    

    
}
