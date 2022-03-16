//
//  AppLink.swift
//
//  Created by MorsyElsokary on 03/03/2022.
//

import SwiftUI

struct AppLink: View {

    // MARK: - Properties
    
    var descriptionText: String
    var linkabelText: String
    var commit: () -> () = {}
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 0) {
            Text(descriptionText)
                .foregroundColor(.smoothBlack)
            
            Button { commit() } label: {
                Text(linkabelText)
                    .foregroundColor(.goldenYellow)
            }
        }
        .font(.poppinsSemiBold(14))
    }
}

struct AppLink_Previews: PreviewProvider {
    static var previews: some View {
        AppLink(descriptionText: "Don't have an Account", linkabelText: "Register")
    }
}
