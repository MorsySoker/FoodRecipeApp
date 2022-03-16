//
//  ToastMsg.swift
//  Leedo
//
//  Created by MorsyElsokary on 06/03/2022.
//

import SwiftUI

struct ToastMsg: View {
    var message: String
    var body: some View {
        VStack {
            Spacer()

            HStack {
                Text(message)
                    .font(.poppinsRegular(14))
                    .foregroundColor(.white)
                    .padding()

                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 85)
        .background(Color.goldenYellow)
    }
}

struct ToastMsg_Previews: PreviewProvider {
    static var previews: some View {
        ToastMsg(message: "Hello")
    }
}
