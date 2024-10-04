//
//  ContactRepositoryProtocol.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation

protocol ContactRepositoryProtocol {
    func fetchAllContacts() async throws -> [FetchContactDto]
    func fetchContact(by id: UUID) -> ContactEntity?
    func addContact(_ contact: AddContactDto) async throws -> Void
    func updateContact(_ contact: ContactEntity)
    func deleteContact(by id: UUID)
}
