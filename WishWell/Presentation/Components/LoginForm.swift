//
//  LoginForm.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 28/09/2024.
//

import SwiftUI

struct LoginForm: View {
    @EnvironmentObject var viewModel: LoginViewModel // Access the ViewModel from the environment
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
        
        CustomButton(label: "Login") {
            viewModel.login()
            if viewModel.isAuthenticated {
                print("LA")
            }
        }
    }
}

#Preview {
    let viewModel = LoginViewModel() // Create an instance of LoginViewModel

   LoginForm().environmentObject(viewModel) // Provide the environment object

}
