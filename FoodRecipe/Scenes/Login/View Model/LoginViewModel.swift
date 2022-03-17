//
//  LoginViewModel.swift
//  FoodRecipe
//
//  Created by MorsyElsokary on 15/03/2022.
//

import Combine
import FoodRecipeServices

final class LoginViewModel: ObservableObject {
    // MARK: - Input Properties
    @Published var username = ""
    @Published var password = ""

    // MARK: - Output Properties

    @Published var shouldLogin = false
    @Published var errorMessage = ""
    @Published var error = false

    // MARK: - Properties

    private var cancellableSet: Set<AnyCancellable> = []
    private var userService: UserServiceProtocol

    // MARK: - Init

    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
        bind()
    }

    // MARK: - Methods

    private func bind() {
        $errorMessage
            .receive(on: RunLoop.main)
            .map { !$0.isEmpty }
            .assign(to: \.error, on: self)
            .store(in: &cancellableSet)
    }

    func login() {
        userService.login(username: username, password: password).sink { [weak self] completion in
            //print(self?.username , self?.password)
            if case let .failure(error) = completion {
                self?.errorMessage = error.localizedDescription
            }
        } receiveValue: { [weak self] _ in
            self?.shouldLogin = true
        }
        .store(in: &cancellableSet)
    }
}
