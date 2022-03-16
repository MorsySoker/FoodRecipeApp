//
//  AuthHeader.swift
//  Leedo
//
//  Created by MorsyElsokary on 03/03/2022.
//

import SwiftUI

struct AuthHeader: View {
    
    // MARK: - Properties
    
    var headerText: String
    var headerDescription: String
    
    // MARK: View Compnents
    
    @ViewBuilder
    private var logo: some View {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 64)
                .hCenter()
    }
    
    @ViewBuilder
    private var header: some View {
        VStack {
            Text(headerText)
                .hLeading()
            
            Text(headerDescription)
                .hLeading()
        }
        .font(.poppinsSemiBold(28))
        .foregroundColor(.smoothBlack)
    }
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: 25) {
            logo
            
            header
        }
    }
}

struct AuthHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeader(headerText: "Create", headerDescription: "New Account")
    }
}
