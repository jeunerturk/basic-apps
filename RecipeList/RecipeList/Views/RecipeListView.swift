//
//  RecipeListView.swift
//  RecipeList
//
//  Created by Umut Can Ertürk on 21.09.2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("All Recipes")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink {
                                RecipeDetailView(recipe: r)
                            } label: {
                                HStack(spacing: 20.0) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack (alignment: .leading){
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .bold()
                                        RecipeHighlights(highlightArray: r.highlights)
                                            .foregroundColor(.black)
                                            .font(.subheadline)
                                    }
                                }
                            }

                            
                            
                            
                        }
                    }
                    
                }
                
            }.navigationBarHidden(true)
                .padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
