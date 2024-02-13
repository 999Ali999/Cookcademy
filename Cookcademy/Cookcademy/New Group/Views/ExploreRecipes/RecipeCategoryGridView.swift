//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Ali on 10/02/24.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    @StateObject private var recipeData = RecipeData()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                let columns = [GridItem(), GridItem()]
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self) {
                        category in
                        NavigationLink(
                            destination: RecipesListView(category: category)
                                .environmentObject(recipeData),
                            label: {
                                CategoryView(category: category)
                            })
                    }
                })
                .navigationTitle("Categories")
                .toolbarTitleDisplayMode(.inline)
            }
            .padding()
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.55)
                .cornerRadius(5)
                .shadow(radius: 5)
            Text(category.rawValue)
                .font(.title2)
                .bold()
                .foregroundStyle(.black)
                .kerning(5)
        }
    }
}

#Preview {
    RecipeCategoryGridView()
}
