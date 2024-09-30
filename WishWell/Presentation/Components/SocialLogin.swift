//
//  SocialLogin.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import SwiftUI

struct SocialLogin: View {
    @ObservedObject var viewModel: LoginViewModel // Use ObservedObject

    var body: some View {
            Button(action: {
                viewModel.loginFromSocialLogin()
            } ) {
                HStack {
                    Image(systemName: "house") // Ensure this matches your asset name
                               .resizable()
                               .foregroundColor(Color.black) // Set the icon color
                               .frame(width: 30, height: 30)
                               .cornerRadius(10) // Optional: to add rounded corners

                } .frame(maxWidth: 100) // Make the button take the full width
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .cornerRadius(10) // Define the corner radius for the button
                    .overlay(
                        RoundedRectangle(cornerRadius: 10) // Define the corner radius for the border
                            .stroke(Color.black.opacity(0.3), lineWidth: 1) // Set the border color and width
                    )
            }
    }

}

#Preview {
    // Create an instance of LoginViewModel for the preview
    let viewModel = LoginViewModel()
     
    // You can set some initial values if desired
    viewModel.username = ""
    viewModel.password = ""
    return SocialLogin(viewModel: viewModel)
}
