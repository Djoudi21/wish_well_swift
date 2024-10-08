//
//  ContactsList.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 30/09/2024.
//

import SwiftUI

struct ContactsList: View {
    @Binding var filteredContacts: [ContactEntity]

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach($filteredContacts) {contact in
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
    let filteredContacts = viewModel.filteredContacts
    ContactsList(filteredContacts:  .constant([ContactEntity(id: UUID(), name: "Maman", relationship:.colleague, events: [
        EventEntity(id: UUID(), name: "name", type: .birthday, date: Date(), contactIds:[UUID()])
    ])]))
}
