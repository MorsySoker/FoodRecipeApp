//
//  SplashView.swift
//  FoodRecipe
//
//  Created by MorsyElsokary on 15/03/2022.
//

import SwiftUI

struct SplashView: View {

    // MARK: - Properties

    @EnvironmentObject var appState: AppState

    private enum Strings {
        static let spalshAnimationFileName = "food"
    }

    // MARK: - Body

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.goldenYellow, Color.bloodyRed]), startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.vertical)
        .overlay(
            LottieView(name: Strings.spalshAnimationFileName)
                .offset(y: -20)
        )
        .task { await delay() }
    }

    private func delay() async {
        // Delay of 2 seconds (1 second = 1_000_000_000 nanoseconds)
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        DispatchQueue.main.async {
            appState.currentRoot = .authentication
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
