import Foundation

class FetchEventDto: Decodable {
    var id: UUID
    var name: String
    var date: Date
    var type: EventType
    var createdAt: Date
    var updatedAt: Date
    var contacts: [FetchContactDto]
    
    // Custom initializer
     init(id: UUID, name: String, date: Date, type: EventType, createdAt: Date, updatedAt: Date, contacts: [FetchContactDto]) {
         self.id = id
         self.name = name
         self.date = date
         self.type = type
         self.createdAt = createdAt
         self.updatedAt = updatedAt
         self.contacts = contacts
     }
    
    // Custom decoding logic to handle the nested "contacts" array
    enum CodingKeys: String, CodingKey {
        case id, name, date, type, createdAt, updatedAt, contacts
    }

    // Nested key to match the "contact" key in JSON
    struct ContactWrapper: Decodable {
        let contact: FetchContactDto
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.date = try container.decode(Date.self, forKey: .date)
        self.type = try container.decode(EventType.self, forKey: .type)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        
        // Decode the nested contacts array, each wrapped in "contact" key
        let contactWrappers = try container.decode([ContactWrapper].self, forKey: .contacts)
        self.contacts = contactWrappers.map { $0.contact }
    }
}
