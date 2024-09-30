//
//  ContactsListItem.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 01/10/2024.
//

import SwiftUI

struct ContactsListItem: View {
    @Binding var contact: Contact
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
        }.padding().background(Color.red).cornerRadius(5)
    }
}

#Preview {
    ContactsListItem(contact: .constant(Contact(id: "1", username: "toto", relationship: .family, events: [
        Event(id: "1", type: .birthday, date: Date())
    ], nextEvent: Event(id: "1", type: .birthday, date: Date()))))
}
