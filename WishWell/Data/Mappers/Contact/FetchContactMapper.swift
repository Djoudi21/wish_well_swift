//
//  ContactMapper.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation

class FetchContactMapper: Mapper {
    func toDto(_ entity: ContactEntity) -> FetchContactDto {
        return FetchContactDto(
            id: entity.id ?? UUID(),
            name: entity.username, // Assuming username corresponds to name
            email: "entity.email", // Provide the appropriate logic to get the email from ContactEntity
            birthday: entity.nextEvent.date, // Assuming this is how you derive the birthday
            interests: [], // Ensure this property is available in ContactEntity
            relationship: entity.relationship, // This should match the type
            lastGift: "", // Provide the appropriate logic to get the last gift
            createdAt: Date(), // Set as needed; consider using actual creation date if available
            updatedAt: Date(), // Set as needed; consider using actual update date if available
            userId: UUID()// Ensure this property is available in ContactEntity
        )
    }
        
    func toEntity(_ data: FetchContactDto) -> ContactEntity {
        return ContactEntity(id: data.id, username: data.name, email: "a@a.com", relationship: data.relationship, events: [EventEntity(id: "1", type: .birthday, date: Date())], nextEvent: EventEntity(id: "1", type: .birthday, date: Date()))
    }
}
