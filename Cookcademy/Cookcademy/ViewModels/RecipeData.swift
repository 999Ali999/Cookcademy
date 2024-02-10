//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Ali on 10/02/24.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
