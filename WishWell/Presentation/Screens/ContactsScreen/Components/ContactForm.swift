//
//  ContactForm.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 02/10/2024.
//

import SwiftUI

struct ContactForm: View {
    @EnvironmentObject var viewModel: ContactViewModel // Access the ViewModel from the environment
    @State private var username: String = ""
    @State private var relationship: RelationshipType = .family
    @State private var event: EventType = .birthday
    @State private var selectedRelationshipOption = "Famille"
    @State private var selectedEventOption = "Anniversaire"
    @State private var birthday: Date = Date() // State variable for the selected date

    // Create a dictionary mapping labels to RelationshipType
   let relationshipOptions: [String: RelationshipType] = [
       "Famille": .family,
       "Amis": .friend,
       "Collegues": .colleague
   ]
    
    // Create a dictionary mapping labels to RelationshipType
    let eventOptions: [String: EventType] = [
        "Anniversaire": .birthday
   ]
    
    var body: some View {
        TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
        
        Picker("Select an relationship", selection: $selectedRelationshipOption) {
            ForEach(Array(relationshipOptions.keys), id: \.self) { label in
                Text(label).tag(relationshipOptions[label])
            }
        }
        .pickerStyle(MenuPickerStyle())
        .onChange(of: selectedRelationshipOption) { oldValue, newValue in
            if let selectedRelationship = relationshipOptions[newValue] {
                   relationship = selectedRelationship
               }
        }
        
        Picker("Select an event", selection: $selectedEventOption) {
            ForEach(Array(eventOptions.keys), id: \.self) { label in
                Text(label).tag(eventOptions[label])
            }
        }
        .pickerStyle(MenuPickerStyle())
        .onChange(of: selectedEventOption) { oldValue, newValue in
            let selectedEvent = eventOptions[newValue] ?? .birthday
            event = selectedEvent
        }
        
        DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                       .datePickerStyle(DefaultDatePickerStyle()) // Style for the DatePicker
                       .padding()
        
        CustomButton(label: "Submit") {
            Task {
                   let newContactValues = NewContactFormValues(
                       username: username,
                       relationship: relationship,
                       event: event,
                       birthday: birthday
                   )
                  try await viewModel.addContact(using: newContactValues)
               }
        }
    }
}

#Preview {
    ContactForm()
}
