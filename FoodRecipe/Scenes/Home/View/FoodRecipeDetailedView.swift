//
//  FoodRecipeDetailedView.swift
//  FoodRecipe
//
//  Created by MorsyElsokary on 13/03/2022.
//

import SwiftUI
import FoodRecipeServices

struct FoodRecipeDetailedView: View {
    
    // MARK: - Properties
    
    @Environment (\.dismiss) var dismiss
    @State private var isIngredientsExpanded: Bool = false
    var foodRecipe: RecipesModel
    
    // MARK: - init
    
    init(foodRecipe: RecipesModel) {
        self.foodRecipe = foodRecipe
    }
    
    // MARK: - View Compnents
    
    @ViewBuilder
    private var recipeImage: some View {
        if let imageURL = URL(string: foodRecipe.image) {
            WebImageView(imageURL: imageURL)
                .shadow(color: Color.gray, radius: 6, x: 0, y: 3)
        }
    }
    
    private var dismissBtn: some View {
        VStack {
            HStack {
                Spacer()
                
                Button { dismiss.callAsFunction() } label: {
                    Image(systemName: "chevron.down.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.bloodyRed)
                }
                .padding()
            }
            
            Spacer()
        }
    }
    
    private var recipeProperties: some View {
        HStack {
            VStack(alignment: .leading) {
                recipePropertie(propertieName: "Calories : ",
                                propertieValue: foodRecipe.calories)
                
                recipePropertie(propertieName: "Carbos : ",
                                propertieValue: foodRecipe.carbos)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                recipePropertie(propertieName: "Fats : ",
                                propertieValue: foodRecipe.fats)
                
                recipePropertie(propertieName: "Proteins : ",
                                propertieValue: foodRecipe.proteins)
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private var recipeIngredients: some View {
        VStack(alignment: .leading) {
            Button { isIngredientsExpanded.toggle() } label: {
                HStack(alignment: .center, spacing: 5) {
                    Text("Recipe Ingredients")
                    
                    Image(systemName: "chevron.right")
                        .rotationEffect(Angle(degrees: isIngredientsExpanded ? 90 : 0 ))
                }
            }
            .padding()
            .hCenter()
            .font(.subheadline)
            .foregroundColor(.primary)
            .background(LinearGradient(gradient: Gradient(colors: [.goldenYellow, .bloodyRed]), startPoint: .topLeading , endPoint: .bottomTrailing).cornerRadius(20))
            
            if isIngredientsExpanded {
                ForEach(foodRecipe.ingredients, id: \.self) {
                    Text($0)
                        .foregroundColor(.green)
                }
            }
        }
        .padding(.horizontal)
        .animation(Animation.easeInOut, value: isIngredientsExpanded)
    }
    
    private var recipeInformation: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                RecipeHeadline(foodRecipe: foodRecipe)
                
                recipeProperties
                
                recipeIngredients
                
                Text(foodRecipe.welcomeDescription)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            recipeImage
            
            recipeInformation
        }
        .overlay(dismissBtn)
        .edgesIgnoringSafeArea(.top)
    }
}

struct recipePropertie: View {
    
    // MARK: - Properties
    
    var propertieName: String
    var propertieValue: String
    
    // MARK: - Body
    
    var body: some View {
        Text(propertieName)
            .foregroundColor(.primary)
            .font(.subheadline)
        +
        Text(propertieValue)
            .foregroundColor(.green)
            .font(.subheadline)
    }
}

struct RecipeHeadline: View {
    
    // MARK: - Properties
    
    var foodRecipe: RecipesModel
    
    // MARK: - Body
    
    var body: some View {
        Group {
            Text(foodRecipe.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
            
            Text(foodRecipe.headline.uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.bottom, 0)
        .padding(.horizontal)
    }
}
