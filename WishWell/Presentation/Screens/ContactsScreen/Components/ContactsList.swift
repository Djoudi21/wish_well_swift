//
//  ContactsList.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 30/09/2024.
//

import SwiftUI

struct ContactsList: View {
    @ObservedObject var viewModel: ContactViewModel // Use ObservedObject

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach($viewModel.contacts) {contact in
                        ContactsListItem(contact: contact)
                    }
                    .padding(.vertical)
                }
            }
        }.padding()
    }
}

#Preview {
    let viewModel = ContactViewModel()
    ContactsList(viewModel: viewModel)
}
