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
                Text(contact.name).padding()
                Spacer()
                Text(contact.relationship.rawValue).padding()
                Spacer()
                Image(systemName: "bell.fill")
            }
            HStack{
                if let nextEvent = contact.nextEvent {
                    Text("Prochain evenement").padding()
                    Text(nextEvent.type.rawValue).padding()
                    Text(formatDate(nextEvent.date)).padding()
                } else {
                    Text("No Upcoming Event").padding()
                }
            }
        }.padding().overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 2)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2) // Light outer shadow
        )

    }
}

#Preview {
    ContactsListItem(contact: .constant(ContactEntity(id: UUID(), name: "toto", relationship: .family, events: [
        EventEntity(id: UUID(), name: "event name", type: .birthday, date: Date(), contactIds: [UUID()])
    ])))
}
