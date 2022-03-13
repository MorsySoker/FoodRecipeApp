//
//  FoodRecipesViewModel.swift
//  FoodRecipe
//
//  Created by MorsyElsokary on 12/03/2022.
//

import Foundation
import Combine
import FoodRecipeServices

class FoodRecipesViewModel: ObservableObject {
    
    // MARK: - Output Properties
    
    @Published var recipes: [RecipesModel] = []
    @Published var selectedRecipe: RecipesModel?
    @Published var errorMessage = ""
    @Published var error = false
    
    // MARK: - Properties
    
    private var cancellable: Set<AnyCancellable> = []
    private var service: RecipesServiceProtocol
    
    // MARK: - init
    
    init(service: RecipesServiceProtocol = RecipesService()) {
        self.service = service
        bind()
        getRecipes()
    }
    
    // MARK: - Methods
    
    func bind() {
        $errorMessage
            .receive(on: RunLoop.main)
            .map { !$0.isEmpty }
            .assign(to: \.error, on: self)
            .store(in: &cancellable)
    }
    
    func getRecipes() {
        service.getRecipes()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: onReceive, receiveValue: onReceive)
            .store(in: &cancellable)
    }
    
    // MARK: - Private Methods

    private func onReceive(_ completion: Subscribers.Completion<NetworkError>) {
        if case let .failure(error) = completion {
            errorMessage = error.localizedDescription
        }
    }

    private func onReceive(_ response: [RecipesModel]) {
        recipes = response
    }
}
