import Foundation

class AddEventMapper {
    func toDto(_ formValues: NewEventFormValues) -> AddEventDto {
        let dto = AddEventDto(
            name: formValues.name,
            type: formValues.type,
            date: formValues.date,
            contactIds: [],
            contacts: [AddContactDto(
                name: formValues.contactFormValues?.name ?? "",
                birthday: formValues.contactFormValues?.birthday ?? Date(),
                interests: [],
                relationship: formValues.contactFormValues?.relationship ?? .colleague
            )]
        )

        return dto
    }
}
