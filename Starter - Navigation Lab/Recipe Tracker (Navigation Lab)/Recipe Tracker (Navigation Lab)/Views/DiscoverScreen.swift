//
//  DiscoverView.swift
//  Recipe Tracker (Navigation Lab)
//
//  Created by Jane Madsen on 10/8/25.
//

import SwiftUI

struct DiscoverScreen: View {

    let discoverRecipes = Recipe.discoverList

    var body: some View {
        NavigationStack {
            List(discoverRecipes) { recipe in
                NavigationLink(value: recipe) {
                    Text(recipe.title)
                }
            }
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetailScreen(recipe: recipe)
            }
            .navigationTitle("Discover")
        }
    }
}

#Preview {
    DiscoverScreen()
}
