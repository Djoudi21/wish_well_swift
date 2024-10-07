import Foundation

class FetchAllEventsUseCase {
    
    private let eventRepository: EventRepositoryProtocol
    private let fetchEventMapper = FetchEventMapper()

     // Injecting the repository via initializer
    init(eventRepository: EventRepositoryProtocol) {
         self.eventRepository = eventRepository
     }

    // Marking execute() as async throws
    func execute() async throws -> [EventEntity] {
        let events =  try await eventRepository.fetchAllEvents();

        // Create an array to hold the mapped entities
        var eventEntities: [EventEntity] = []
        
        for event in events {
            let eventEntity = fetchEventMapper.toEntity(event)
            eventEntities.append(eventEntity)
        }
        return eventEntities
    }
}
