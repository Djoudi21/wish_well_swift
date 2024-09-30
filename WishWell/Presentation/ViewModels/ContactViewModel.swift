//
//  ContactViewModel.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 30/09/2024.
//

import Foundation

enum RelationshipType: String, CaseIterable, Identifiable {
    case family = "Family"
    case friend = "Friend"
    
    var id: String { self.rawValue }
}

enum EventType: String, CaseIterable, Identifiable {
    case birthday = "Birthday"
    
    var id: String { self.rawValue }
}

struct Event: Identifiable {
    var id: String
    var type: EventType
    var date: Date
}

struct Contact: Identifiable {
    var id: String
    var username: String
    var relationship: RelationshipType
    var events: [Event]
    var nextEvent: Event
}

class ContactViewModel: ObservableObject {
    @Published var searchInputValue: String = ""
    @Published var contacts: [Contact] = [
        Contact(id: "1", username: "Maman", relationship:.family, events: [
            Event(id: "1", type: .birthday, date: Date())
        ], nextEvent: Event(id: "1", type: .birthday, date: Date())),
        Contact(id: "2", username: "Maman", relationship:.family, events: [
            Event(id: "1", type: .birthday, date: Date())
        ], nextEvent: Event(id: "1", type: .birthday, date: Date())),
        Contact(id: "3", username: "Maman", relationship:.family, events: [
            Event(id: "1", type: .birthday, date: Date())
        ], nextEvent: Event(id: "1", type: .birthday, date: Date())),
        Contact(id: "4", username: "Maman", relationship:.family, events: [
            Event(id: "1", type: .birthday, date: Date())
        ], nextEvent: Event(id: "1", type: .birthday, date: Date()))
    ]
    
    init() {
        // Any initialization logic, such as fetching stored credentials
    }
    
    
    func searchContact(){
        print("Searching for contact with input: \(searchInputValue)")  // Now use the input value
    }
    
    func filterContact(){
        print("Searching for contact with input: \(searchInputValue)")  // Now use the input value
    }
}
