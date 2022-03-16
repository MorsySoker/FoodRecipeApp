//
//  FloatingTextField.swift
//  LeadScrm
//
//  Created by MorsyElsokary on 26/01/2022.
//

import SwiftUI

struct FloatingTextField: View {
    
    // MARK: - Field Type
    
    enum FieldType {
        case defualt
        case secure
        case editField
    }
    
    // MARK: - Properties
    
    @Binding var bindingText: String
    var textFieldLabel: Text
    var color: Color = .black
    var isValidated: Bool = false
    @State var fieldType: FieldType = . defualt
    @State var showPassword: Bool = false
    
    // MARK: - View Compnents
    
    @ViewBuilder
    private var defualtTextField: some View {
        TextField("", text: $bindingText)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
    }
    
    @ViewBuilder
    private var secureTextFiled: some View {
        ZStack {
            if showPassword {
                TextField("", text: $bindingText)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
            }else {
                SecureField("", text: $bindingText)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
            }
            HStack {
                Spacer()
                
                Button { self.showPassword.toggle() } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .padding(.trailing , 3)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 25)
    }
    
    @ViewBuilder
    private var editFiled: some View {
        TextEditor(text: $bindingText)
    }
    
    @ViewBuilder
    private var validated: some View {
        HStack {
            Spacer()
            
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
        }.padding(.horizontal)
    }
    
    @ViewBuilder
    private var fieldTypeSwitcher: some View {
        switch fieldType {
        case .defualt:
            DefualtTextField(bindingText: $bindingText)
        case .secure:
            secureTextFiled
        case .editField:
            editFiled
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        superTextFieldView()
            .background(BackgroundFloatingView())
    }
    
    @ViewBuilder
    private func superTextFieldView() -> some View {
        ZStack(alignment: .leading) {
            if bindingText.isEmpty {textFieldLabel.padding(.leading, 3)}
            
            if isValidated { validated }
            
            fieldTypeSwitcher
        }
        .font(.poppinsRegular(14))
        .foregroundColor(color)
        .tint(color)
        .accentColor(color)
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 25)
        .padding()
    }
}

struct DefualtTextField: View {
    
    // MARK: - Properties
    
    @Binding var bindingText: String
    
    var body: some View {
        TextField("", text: $bindingText)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
    }
}
