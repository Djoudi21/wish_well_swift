import Foundation

class AddEventMapper {
    func toDto(_ formValues: NewEventFormValues) -> AddEventDto {
        let contactIds: [UUID]? = formValues.contactIds.map {
            $0
        } ?? []
        
        let contacts: [AddContactDto] = formValues.contactFormValues != nil ? [
                    AddContactDto(
                        name: formValues.contactFormValues?.name ?? "",  // Safely unwrap the name
                        birthday: formValues.contactFormValues?.birthday ?? Date(),
                        interests: [],
                        relationship: formValues.contactFormValues?.relationship ?? .colleague
                    )
                ] : []
        
        let dto = AddEventDto(
            name: formValues.name,
            type: formValues.type,
            date: formValues.date,
            contactIds: contactIds,
            contacts: contacts
        )

        return dto
    }
}
