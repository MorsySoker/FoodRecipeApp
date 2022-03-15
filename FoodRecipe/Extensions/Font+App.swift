//
//  Font+App.swift
//  LeadScrm
//
//  Created by MorsyElsokary on 26/01/2022.
//

import SwiftUI

extension Font {

    // MARK: - Methods

    static func poppinsBold(_ size: CGFloat) -> Font {
        Font.custom("Poppins Bold", size: size)
    }

    static func poppinsMedium(_ size: CGFloat) -> Font {
        Font.custom("Poppins Medium", size: size)
    }

    static func poppinsRegular(_ size: CGFloat) -> Font {
        Font.custom("Poppins Regular", size: size)
    }

    static func poppinsLight(_ size: CGFloat) -> Font {
        Font.custom("Poppins Light", size: size)
    }
    
    static func poppinsSemiBold(_ size: CGFloat) -> Font {
        Font.custom("Poppins SemiBold", size: size)
    }
}
