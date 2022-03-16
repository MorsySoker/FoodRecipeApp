//
//  LoginView.swift
//  Leedo
//
//  Created by MorsyElsokary on 03/03/2022.
//

import SwiftUI
import SSToastMessage

struct LoginView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var appState: AppState

    @EnvironmentObject var loginVM: LoginViewModel

    //@StateObject var loginVM = LoginViewModel()
    
    @State var email: String = ""
    
    @State var password: String = ""
    
    @State var wanaRegister: Bool = false
    
    @State var isLoading: Bool = false
    
    // MARK: - View Compnents
    
    @ViewBuilder
    private var header: some View {
        AuthHeader(headerText: "Welcome Back!",
                   headerDescription: "Login")
    }
    
    @ViewBuilder
    private var loginFields: some View {
        FloatingTextField(bindingText: $loginVM.username,
                          textFieldLabel: Text("User Name"),
                          color: .black)
        
        FloatingTextField(bindingText: $loginVM.password,
                          textFieldLabel: Text("Password"),
                          color: .black,
                          fieldType: .secure)
    }
    
    @ViewBuilder
    private var loginBtn: some View {
        Button { loginVM.login() } label: {
            AppBtnLabel(text: "Login",
                        isLoading: isLoading)
        }
        .disabled(isLoading)
    }
    
    @ViewBuilder
    private var linkBtn: some View {
        AppLink(descriptionText: "Don't have an account?",
                linkabelText: " Create one") {
            wanaRegister.toggle()
        }
    }
    
    @ViewBuilder
    private var loginView: some View {
        VStack(spacing: 25){
            header
            
            loginFields
            
            loginBtn
            
            linkBtn
            
            Spacer()
        }
        .hPadding()
        .padding(.top, 50)
        .present(isPresented: $loginVM.error, type: .toast, position: .top) {
            ToastMsg(message: loginVM.errorMessage)
        }
        .onReceive(loginVM.$shouldLogin) { shouldLogin in
            if shouldLogin {
                appState.currentRoot = .home
            }
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            AppBackground()
            
            loginView
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
