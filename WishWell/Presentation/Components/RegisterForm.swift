//
//  RegisterForm.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import SwiftUI

struct RegisterForm: View {
    @ObservedObject var viewModel: LoginViewModel // Use ObservedObject

    var body: some View {
            TextField("Username", text: $viewModel.username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .padding()
                        }
                        
                        Button(action: {
                            viewModel.login()
                        }) {
                            Text("Register")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding()
        }
}

#Preview {
    // Create an instance of LoginViewModel for the preview
    let viewModel = LoginViewModel()
     
    // You can set some initial values if desired
    viewModel.username = ""
    viewModel.password = ""
    return RegisterForm(viewModel: viewModel)
}
