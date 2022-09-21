//
//  RecipeModel.swift
//  RecipeList
//
//  Created by Umut Can Ertürk on 21.09.2022.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        recipes = DataService.getLocalData()
        
        
    }
    
}
