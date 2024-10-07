import Foundation

class AddEventUseCase {
    private let eventRepository: EventRepositoryProtocol
    private let addEventMapper = AddEventMapper()
    
    init(eventRepository: EventRepositoryProtocol) {
        self.eventRepository = eventRepository
    }
    
    func execute(newEventForm: NewEventFormValues)  async throws -> Void {
        let dto = addEventMapper.toDto(newEventForm)
        try await eventRepository.addEvent(dto)
    }
}
