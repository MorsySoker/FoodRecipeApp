//
//  View+App.swift
//  Leedo
//
//  Created by MorsyElsokary on 03/03/2022.
//

import SwiftUI

extension View {
    
    //MARK: - Vertical Center
    func VCenter()-> some View {
        self.frame(maxHeight: .infinity, alignment: .center)
    }
    
    //MARK: - Vertical Top
    func VTop()-> some View {
        self.frame(maxHeight: .infinity, alignment: .top)
    }
    
    //MARK: - Vertical Bottom
    func VBottom()-> some View {
        self.frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    //MARK: - Horizontal Center
    func hCenter()-> some View {
        self.frame(maxWidth: .infinity, alignment: .center)
    }
    
    //MARK: - Horizontal Leading
    func hLeading()-> some View {
        self.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    //MARK: - Horizontal Trailing
    func hTrailing()-> some View {
        self.frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    //MARK: - Horizontal Padding
    func hPadding()-> some View {
        self.padding(.horizontal, 36)
    }
}
