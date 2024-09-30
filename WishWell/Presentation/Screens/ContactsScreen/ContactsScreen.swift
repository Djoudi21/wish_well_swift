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
                ContactsList(viewModel: viewModel)
                Spacer()
            }.navigationTitle("").toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                  Button(action: {
                      // Your button action here
                      print("Button tapped")
                  }) {
                      Image(systemName: "plus.circle")
                          .resizable()
                          .scaledToFit()
                          .frame(width: 40, height: 40)
                          .foregroundColor(.blue)
                  }
              }
            }
        }
    }
}

#Preview {
    let viewModel = ContactViewModel()
    ContactsScreen().environmentObject(viewModel)
}
