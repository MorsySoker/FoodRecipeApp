//
//  HomeView.swift
//  FoodRecipe
//
//  Created by MorsyElsokary on 11/03/2022.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0..<10, id: \.self) { _ in
                    Button(action: {}) {
                        RecipeItemCard()
                    }
                }
            }.padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct RecipeItemCard: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image("StockFoodItemImage")
                .resizable()
                .scaledToFit()
                .shadow(color: Color.gray,
                        radius: 6, x: 0, y: 3)
            
            Text("Crispy Fish Goujons")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .lineLimit(3)
                .minimumScaleFactor(0.5)
            
            Text("with Sweet Potato Wedges and Minted Snap Peas")
                .font(.caption)
                    .foregroundColor(.secondary)
        }
        .padding(.bottom)
        .cornerRadius(10)
        .background(BackgroundFloatingView().offset(y: 5))
        .background(BasicBorderView())
    }
}
