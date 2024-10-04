//
//  AddContactUseCase.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation

class AddContactUseCase {
    private let contactRepository: ContactRepositoryProtocol
    private let addContactMapper = AddContactMapper()

    init(contactRepository: ContactRepositoryProtocol) {
        self.contactRepository = contactRepository
    }
    
    
    func execute(newContactForm: NewContactFormValues)  async throws -> Void {
            let dto = addContactMapper.toDto(newContactForm)
            try await contactRepository.addContact(dto)
        }
    }

