//
//  FetchAllContactsUseCase.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation

class FetchAllContactsUseCase {
    
    private let contactRepository: ContactRepositoryProtocol

     // Injecting the repository via initializer
    init(contactRepository: ContactRepositoryProtocol) {
         self.contactRepository = contactRepository
     }

    // Marking execute() as async throws
    func execute() async throws -> [ContactEntity] {
        let contacts =  try await contactRepository.fetchAllContacts();

        // Create an array to hold the mapped entities
        var contactEntities: [ContactEntity] = []
        
        for contact in contacts {
            if let fetchMapper = ContactMapperFactory.getMapper(forKey: "fetch-contact") {
                let contactEntity = fetchMapper.toEntity(contact)
                // Append the mapped entity to the array
                contactEntities.append(contactEntity)
            }
        }

        return contactEntities
    }
}
