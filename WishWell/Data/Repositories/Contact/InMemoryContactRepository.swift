//
//  InMemoryContactRepository.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation


class InMemoryContactRepository: ContactRepositoryProtocol {
    private var contacts: [FetchContactDto] = []

    func addContact(_ contact: AddContactDto) async throws {
        return
    }
        
    func fetchAllContacts() -> [FetchContactDto] {
        return contacts
    }
    
    func fetchContact(by id: UUID) -> ContactEntity? {
        return ContactEntity(id: UUID(), username: "Maman", email: "a@a.com", relationship:.colleague, events: [
            EventEntity(id: "1", type: .birthday, date: Date())
        ], nextEvent: EventEntity(id: "1", type: .birthday, date: Date()))
    }
    
    func updateContact(_ contact: ContactEntity) {
    }
    
    func deleteContact(by id: UUID) {
    }
}
