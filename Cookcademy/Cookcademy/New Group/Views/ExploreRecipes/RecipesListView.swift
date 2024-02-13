//
//  ContentView.swift
//  Cookcademy
//
//  Created by Ali on 05/02/24.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject var recipeData = RecipeData()
    let category: MainInformation.Category
    
    //    private let listBackgroundColor = AppColor.background
    //    private let listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
                }
                //                .listRowBackground(listBackgroundColor)
                //                .foregroundColor(listTextColor)
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension RecipesListView {

  private var recipes: [Recipe] {
    recipeData.recipes(for: category)
  }
  
  private var navigationTitle: String {
    "\(category.rawValue) Recipes"
  }
}



struct RecipesListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      RecipesListView(category: .breakfast)
        .environmentObject(RecipeData())
    }
  }
}
