//
//  ContentView.swift
//  Cookcademy
//
//  Created by Ben Stone on 4/19/21.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject private var recipeData: RecipeData
    
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()
    
    let category: MainInformation.Category
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    isPresenting = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
        })
        .sheet(isPresented: $isPresenting, content: {
            NavigationStack {
                ModifyRecipeView(recipe: $newRecipe)
                    .navigationTitle("Add a New Recipe")
                    .navigationBarTitleDisplayMode(.inline).toolbar(content: {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresenting = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            if newRecipe.isValid {
                                Button("Add") {
                                    recipeData.add(recipe: newRecipe)
                                    isPresenting = false
                                }
                            }
                        }
                    })
            }
        })
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
        }.environmentObject(RecipeData())
    }
}
