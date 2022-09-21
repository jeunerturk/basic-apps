//
//  DataService.swift
//  RecipeList
//
//  Created by Umut Can Ertürk on 21.09.2022.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        let path = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard path != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
               let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    r.id = UUID()
                }
                
                return recipeData
            } catch{
                print(error)
            }
            
        } catch {
            print(error)
        }
        
        return [Recipe]()
    }
    
}
