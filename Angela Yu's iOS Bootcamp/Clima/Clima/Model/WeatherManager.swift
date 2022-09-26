//
//  WeatherManager.swift
//  Clima
//
//  Created by Umut Can Ertürk on 26.09.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3668f8a6ca944938119496293975ec22&units=metric&q="
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // MARK: Create a Url, Create a URLSession, Give the session a task, Start the task
        if let url = URL(string: urlString) {
            
            let session =  URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            task.resume()
            
        }
        
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        if let  safeData = data {
            if let dataString = String(data: safeData, encoding: .utf8) {
                print(dataString)
            }
                
            
            
        }
    }
    
}
