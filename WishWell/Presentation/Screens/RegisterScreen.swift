//
//  RegisterView.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 28/09/2024.
//

import SwiftUI

struct RegisterScreen: View {
    @StateObject private var viewModel = LoginViewModel() // Create an instance of LoginViewModel
    var body: some View {
        VStack {
            Text("Sign up to Wish Well")
                .font(.largeTitle)
                .padding()
            Text("Welcome back !")
            Text("PLEASE SIGN IN TO CONTINUE")

            
            SocialLoginList(viewModel: viewModel)
            
            HStack(alignment: .center) {
                HStack {}.frame(width: 70, height: 1).background(Color.black.opacity(0.3))
                Text("or").background()
                HStack {}.frame(width: 70, height: 1).background(Color.black.opacity(0.3))
            }
            
            RegisterForm(viewModel: viewModel) // Pass the ObservedObject here
        }
    }   
}

#Preview {
    RegisterScreen()
}
