//
//  ContactSearchSection.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 30/09/2024.
//

import SwiftUI

struct ContactSearchSection: View {
    @EnvironmentObject var viewModel: ContactViewModel // Access the ViewModel from the environment
    @State var searchButtonLabel: String = "Login"

    var body: some View {
        VStack {
            TextField("Username", text: $viewModel.searchInputValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                // Use .onChange to trigger an action when input value changes
               .onChange(of: viewModel.searchInputValue) { oldValue, newValue in
                   // Perform the action you want when the input value changes
                   print("Search input value changed to: \(newValue)")
                   // You can also update other state variables or trigger view model actions here
                   viewModel.searchContact(using: newValue)
               }
        }
    }
}

#Preview {
    let viewModel = ContactViewModel() // Create an instance of LoginViewModel

    ContactSearchSection().environmentObject(viewModel)
}
