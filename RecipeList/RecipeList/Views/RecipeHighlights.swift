//
//  RecipeHighlights.swift
//  RecipeList
//
//  Created by Umut Can Ertürk on 24.09.2022.
//

import SwiftUI

struct RecipeHighlights: View {
    var highlights = ""
    
    init(highlightArray: [String]) {
        
        for index in 0..<highlightArray.count {
            
            if index == highlightArray.count - 1 {
                highlights += highlightArray[index]
            } else {
                highlights += "\(highlightArray[index]), "
            }
            
            
            
        }
        
        
    }
    
    var body: some View {
        
        
        
        
        Text(highlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlightArray: ["text", "text3", "texdtx"])
    }
}
