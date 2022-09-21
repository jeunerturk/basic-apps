//
//  Recipe.swift
//  RecipeList
//
//  Created by Umut Can Ertürk on 21.09.2022.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var ingredients: [String]
    var directions: [String]
}
