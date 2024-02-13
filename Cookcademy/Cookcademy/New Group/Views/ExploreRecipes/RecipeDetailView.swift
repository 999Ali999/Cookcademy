//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Ali on 10/02/24.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
//    private let listBackgroundColor = AppColor.background
//    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            HStack {
                Text("Author : \(recipe.mainInformation.author)")
                    .font(.headline)
                    .padding(.horizontal)
                Spacer()
            }
            Spacer()
            Spacer()
            HStack {
                Text("description: \(recipe.mainInformation.description)")
                    .font(.headline)
                    .padding(.horizontal)
                Spacer()
            }
            .padding(.bottom, 10)

            
            List {
                Section(header: Text("Ingredients")) {
                    ForEach(recipe.ingredients.indices, id: \.self) { index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
//                            .foregroundColor(listTextColor)
                    }
                }
//                .listRowBackground(listBackgroundColor)
                Section(header: Text("Directions")) {
                    ForEach(recipe.directions.indices, id: \.self) { index in
                        let direction = recipe.directions[index]
                        HStack {
                            Text("\(index + 1)  ").bold()
                            Text("\(direction.isOptional ? "(Optional) " : "")"
                                 + "\(direction.description)")
//                            .foregroundColor(listTextColor)
                        }
//                        .listRowBackground(listBackgroundColor)
                    }
                }
            }
        }
        .navigationTitle(recipe.mainInformation.name)
        .toolbarTitleDisplayMode(.inline)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    static var previews: some View {
        NavigationView {
            RecipeDetailView(recipe: recipe)
        }
    }
}
