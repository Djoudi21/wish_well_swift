//
//  ContactsScreen.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import SwiftUI

struct ContactsScreen: View {
    @EnvironmentObject var viewModel: ContactViewModel // Access the ViewModel from the environment

    var body: some View {
        NavigationStack {
            VStack {
                ContactSearchSection()
                ContactsFiltersSection()
                Spacer()
                ContactsList(filteredContacts: $viewModel.filteredContacts)
                Spacer()
            }.navigationTitle("").toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                  Button(action: {
                      viewModel.isContactFormPresented = true
                  }) {
                      Image(systemName: "plus.circle")
                          .resizable()
                          .scaledToFit()
                          .frame(width: 40, height: 40)
                          .foregroundColor(.blue)
                  }
              }
            }
            // Sheet presentation for the modal view
            .sheet(isPresented: $viewModel.isContactFormPresented) {
                ContactFormScreen() // This will be presented modally
            }
        }
        .task {
           do {
               // Assuming your viewModel has an async method to fetch contacts
               try await viewModel.fetchAllContacts()
           } catch {}
       }
    }
}

#Preview {
    let viewModel = ContactViewModel()
    ContactsScreen().environmentObject(viewModel)
}
