import Foundation

class FetchEventMapper {
    func toDto(_ entity: EventEntity) -> FetchEventDto {
        // Convert contacts from ContactEntity to FetchContactDto
        let contactsDto = entity.contacts?.compactMap { contactEntity in
            // Assuming you have a method to convert ContactEntity to FetchContactDto
            return convertToFetchContactDto(contactEntity)
        } ?? []
        // Create and return a FetchEventDto using the properties of EventEntity
        return FetchEventDto(
            id: entity.id,
            name: entity.name,
            date: entity.date,
            type: entity.type,
            createdAt: Date(), // Assuming EventEntity has this property
            updatedAt: Date(), // Assuming EventEntity has this property
            contacts: contactsDto
        )
    }
        
    func toEntity(_ data: FetchEventDto) -> EventEntity {
        return EventEntity(id: data.id, name: data.name, type: data.type, date: data.date)
    }
    
    // Placeholder method to convert ContactEntity to FetchContactDto
     private func convertToFetchContactDto(_ contactEntity: ContactEntity) -> FetchContactDto {
         // Implement the conversion logic here
         // Example:
         return FetchContactDto(id: contactEntity.id ?? UUID(), name: contactEntity.name, birthday: Date(), interests: [], relationship: .colleague, createdAt: Date(), updatedAt: Date(), nextEvent: nil)
     }

     // Placeholder method to convert FetchContactDto to ContactEntity
     private func convertToContactEntity(_ fetchContactDto: FetchContactDto) -> ContactEntity {
         // Implement the conversion logic here
         // Example:
         return ContactEntity(id: fetchContactDto.id, name: fetchContactDto.name, relationship: .colleague, nextEvent: nil)
     }
}
