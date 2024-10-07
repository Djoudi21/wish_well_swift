//
//  EventsList.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 04/10/2024.
//

import SwiftUI

struct EventsList: View {
    @Binding var filteredEvents: [EventEntity]

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach($filteredEvents) {event in
                        EventsListItem(event: event)
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

    EventsList(filteredEvents: .constant([EventEntity(id: UUID(), name: "name", type: .birthday, date: Date(), contactIds: [UUID()])]))
}
