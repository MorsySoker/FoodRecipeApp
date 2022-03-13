//
//  WebImageView.swift
//  FoodRecipe
//
//  Created by MorsyElsokary on 13/03/2022.
//

import SDWebImageSwiftUI
import SwiftUI

struct WebImageView: View {
    
    // MARK: - Properties
    
    var imageURL: URL
    
    // MARK: - Body
    
    var body: some View {
        WebImage(url: imageURL)
            .placeholder { Color.cyan }
            .resizable()
            .scaledToFit()
    }
}
