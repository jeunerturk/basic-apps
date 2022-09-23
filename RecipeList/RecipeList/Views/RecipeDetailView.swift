//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Umut Can Ertürk on 21.09.2022.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                VStack(alignment: .leading){
                    Text("Select your serving size:")
                    
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                        .frame(width: 160)
                }.padding(.leading)
                
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    ForEach(recipe.ingredients) { ing in
                        Text("• " + RecipeModel.getPortion(ingredient: ing, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + ing.name.lowercased())
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                        .padding(.top, 1)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
