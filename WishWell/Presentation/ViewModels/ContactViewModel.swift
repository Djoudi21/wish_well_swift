//
//  ContactViewModel.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 30/09/2024.
//

import Foundation

struct NewContactFormValues: Encodable {
    var username: String
    var relationship: RelationshipType
    var event: EventType
    var birthday: Date
}

class ContactViewModel: ObservableObject {
    @Published var searchInputValue: String = ""
    @Published var contacts: [ContactEntity] = []
    @Published var filteredContacts: [ContactEntity] = []
    
    init() {}
    
    func fetchAllContacts() async throws {
        let contactRepository = HttpContactRepository()
        let fetchContactsUseCase = FetchAllContactsUseCase(contactRepository: contactRepository)
        do {
            let fetchedContacts = try await fetchContactsUseCase.execute()
            DispatchQueue.main.async { [weak self] in
                self?.contacts = fetchedContacts // Ensure this runs on the main thread
                self?.filteredContacts = fetchedContacts // Ensure this runs on the main thread
            }
        } catch {
            DispatchQueue.main.async { [weak self] in
                self?.contacts = []
                self?.filteredContacts = []
            }
        }
    }
    
    func addContact(using newContactForm: NewContactFormValues) async throws {
        let contactRepository = HttpContactRepository()
        let addContactUseCase = AddContactUseCase(contactRepository: contactRepository)
        do {
            try await addContactUseCase.execute(newContactForm: newContactForm)
            // Re-fetch contacts after adding a new one
            try await fetchAllContacts()
        } catch {
            DispatchQueue.main.async { [weak self] in
                self?.contacts = []
                self?.filteredContacts = []
            }
        }
    }
    
    
    func searchContact(using inputValue: String){
        guard !inputValue.isEmpty else {
            resetFilters()
            return
        }
        
        filteredContacts = contacts.filter {
            $0.username.lowercased().contains(inputValue.lowercased())
        }
    }
    
    func filterContactByRelationship(for relationship: RelationshipType){
        filteredContacts = contacts.filter {
            $0.relationship == relationship
        }
    }
    
    func resetFilters() {
        filteredContacts = contacts
    }
}
