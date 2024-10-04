//
//  ContactsListItem.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 01/10/2024.
//

import SwiftUI

struct ContactsListItem: View {
    @Binding var contact: ContactEntity
    var body: some View {
        VStack {
            HStack {
                Text(contact.username).padding()
                Spacer()
                Text(contact.relationship.rawValue).padding()
                Spacer()
                Image(systemName: "bell.fill")
            }
            HStack{
                Text(contact.nextEvent.type.rawValue).padding()
                Text(formatDate(contact.nextEvent.date)).padding()
            }
        }.padding().overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 2)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2) // Light outer shadow
        )

    }
}

#Preview {
    ContactsListItem(contact: .constant(ContactEntity(id: UUID(), username: "toto", email: "a@a.com", relationship: .family, events: [
        EventEntity(id: "1", type: .birthday, date: Date())
    ], nextEvent: EventEntity(id: "1", type: .birthday, date: Date()))))
}
