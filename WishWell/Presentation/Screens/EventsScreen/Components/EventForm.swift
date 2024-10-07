import SwiftUI

struct EventForm: View {
    @EnvironmentObject var viewModel: EventViewModel
    @EnvironmentObject var contactViewModel: ContactViewModel
    @State private var name: String = ""
    @State private var contactName: String = ""
    @State private var type: EventType = .birthday
    @State private var date: Date = Date()
    @State private var selectedEventOption = "Anniversaire"
    @State private var selectedContactId: UUID? = nil // Use UUID for selected contact
    @State private var username: String = ""
    @State private var relationship: RelationshipType = .family
    @State private var event: EventType = .birthday
    @State private var birthday: Date = Date()
    @State private var selectedRelationshipOption = "Famille"
    
   let relationshipOptions: [String: RelationshipType] = [
       "Famille": .family,
       "Amis": .friend,
       "Collegues": .colleague
   ]
    
    let eventOptions: [String: EventType] = [
        "Anniversaire": .birthday
   ]
    
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
            
            Picker("Select an event", selection: $selectedEventOption) {
                ForEach(Array(eventOptions.keys), id: \.self) { label in
                    Text(label).tag(eventOptions[label])
                }
            }
            .pickerStyle(MenuPickerStyle())
            .onChange(of: selectedEventOption) { oldValue, newValue in
                let selectedEvent = eventOptions[newValue] ?? .birthday
                type = selectedEvent
            }
            
            DatePicker("Date", selection: $date, displayedComponents: .date)
                           .datePickerStyle(DefaultDatePickerStyle()) // Style for the DatePicker
                           .padding()
            
            Picker("Select a contact", selection: $selectedContactId) {
                // Check if there are no contacts and display appropriate message
                if contactViewModel.contacts.isEmpty {
                    Text("No contacts available").tag(nil as UUID?) // Placeholder when no contacts
                } else {
                    Text("Select a contact").tag(nil as UUID?) // Default option
                    ForEach(contactViewModel.contacts, id: \.id) { contact in
                        Text(contact.name).tag(contact.id as UUID?)
                    }
                }
            }
            .onChange(of: selectedContactId) { oldValue, newValue in
                selectedContactId = newValue
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .disabled(contactViewModel.contacts.isEmpty) // Disable picker if no contacts
            
            if selectedContactId == nil {
                ContactForm(name: $contactName, relationship: $relationship, birthday: $birthday, selectedRelationshipOption: $selectedRelationshipOption)
            }
            
            CustomButton(label: "Submit") {
            Task {
                let newEventFormValues = NewEventFormValues(
                       name: name,
                       type: type,
                       date: date,
                       contactIds: selectedContactId != nil ? [selectedContactId!] : [],
                       contactFormValues: selectedContactId == nil ? NewContactFormValues(name: contactName, relationship: relationship, birthday: birthday) : nil
                )
                try await viewModel.addEvent(using: newEventFormValues)
               }
            }
        }
        .onAppear {
            // Load contacts if they are not already loaded
            contactViewModel.fetchContactsIfNeeded()
        }
        
    }
}

#Preview {
    EventForm()
}
