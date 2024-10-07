import Foundation

class FetchContactMapper {
    func toDto(_ entity: ContactEntity) -> FetchContactDto {
        return FetchContactDto(
            id: entity.id ?? UUID(),
            name: entity.name, // Assuming username corresponds to name
            birthday: Date(), // Assuming this is how you derive the birthday
            interests: [], // Ensure this property is available in ContactEntity
            relationship: entity.relationship, // This should match the type
            createdAt: Date(), // Set as needed; consider using actual creation date if available
            updatedAt: Date(), // Set as needed; consider using actual update date if available
            nextEvent: nil
        )
    }
        
    func toEntity(_ data: FetchContactDto) -> ContactEntity {
        return ContactEntity(id: data.id, name: data.name, relationship: data.relationship, nextEvent: data.nextEvent ?? nil)
    }
}
