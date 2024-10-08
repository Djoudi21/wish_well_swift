import Foundation

struct NewEventFormValues {
    var name: String
    var type: EventType
    var date: Date
    var contactIds: [UUID]?
    var contactFormValues: NewContactFormValues?
}

class EventViewModel: ObservableObject {
    @Published var searchInputValue: String = ""
    @Published var events: [EventEntity] = []
    @Published var filteredEvents: [EventEntity] = []
    @Published var isEventFormPresented = false // State to trigger the modal

    init() {}

    func fetchAllEvents()  async throws {
        let eventRepository = HttpEventRepository()
        let fetchAllEventsUseCase = FetchAllEventsUseCase(eventRepository: eventRepository)
        do {
            let fetchedEvents = try await fetchAllEventsUseCase.execute()

            DispatchQueue.main.async { [weak self] in
                self?.events = fetchedEvents // Ensure this runs on the main thread
                self?.filteredEvents = fetchedEvents // Ensure this runs on the main thread
            }
        } catch {
            DispatchQueue.main.async { [weak self] in
                self?.events = []
                self?.filteredEvents = []
            }
        }
    }
    
    func addEvent(using newEventForm: NewEventFormValues) async throws {
        let eventRepository = HttpEventRepository()
        let addEventUseCase = AddEventUseCase(eventRepository: eventRepository)

        do {
            try await addEventUseCase.execute(newEventForm: newEventForm)
            try await fetchAllEvents()
            DispatchQueue.main.async { [weak self] in
                self?.isEventFormPresented = false
            }
        } catch {
            DispatchQueue.main.async { [weak self] in
                self?.events = []
                self?.filteredEvents = []
            }
        }
    }
}
