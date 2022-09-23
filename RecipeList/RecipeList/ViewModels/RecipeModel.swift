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
    
    
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            numerator *= targetServings
            denominator *= recipeServings
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            
            numerator /= divisor
            denominator /= divisor
            
            if numerator >= denominator {
                
                wholePortions = numerator / denominator
                numerator %= denominator
                
                portion += String(wholePortions)
                
            }
            
            if numerator > 0 {
                
                portion = wholePortions > 0 ? "\(wholePortions) " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
            if var unit = ingredient.unit {
                
                
                if wholePortions > 1 {
                    
                    if unit.suffix(2) == "ch" {
                        unit += "es"
                    } else if unit.suffix(1) == "f" {
                        unit = String(unit.dropLast())
                        unit += "ves"
                    } else {
                        unit += "s"
                    }
                    
                }
                
                
                
                portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
                
                return portion + unit
            }
            
        }
        
        
        return  portion
    }
}
