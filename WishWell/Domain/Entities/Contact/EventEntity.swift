
import Foundation

enum EventType: String, CaseIterable, Identifiable, Decodable, Encodable {
    case birthday = "BIRTHDAY"
    
    var id: String { self.rawValue }
}

struct EventEntity: Identifiable, Codable {
    var id: UUID
    var name: String
    var type: EventType
    var date: Date
    var contactIds: [UUID]?
    var contacts: [ContactEntity]?
    // Computed property to get contact names from contacts
    var contactNames: [String] {
        return contacts?.map { $0.name } ?? []
    }
}
