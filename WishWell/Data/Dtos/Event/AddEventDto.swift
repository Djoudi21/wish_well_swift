import Foundation

class AddEventDto: Decodable, Encodable, CustomStringConvertible {
    let name: String
    let type: EventType
    let date: Date
    let contactIds: [UUID]?
    let contacts: [AddContactDto]?
    
    var description: String {
            // Customize the output to include all relevant fields
            return """
            AddEventDto {
                name: \(name),
                type: \(type),
                date: \(date),
                contactIds: \(contactIds?.map { $0.uuidString } ?? []),
                contacts: \(contacts?.map { "\($0.name)" } ?? [])
            }
            """
        }
    
    init(name: String, type: EventType, date: Date, contactIds: [UUID]?, contacts: [AddContactDto]?) {
        self.name = name
        self.type = type
        self.date = date
        self.contactIds = contactIds
        self.contacts = contacts
    }
    
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case date
        case contactIds
        case contacts
    }
    
    // MARK: - Decodable Implementation
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(EventType.self, forKey: .type)
        date = try container.decode(Date.self, forKey: .date)
        
        // Safely decode  as optional
        contactIds = try container.decodeIfPresent([UUID].self, forKey: .contactIds) ?? []
        contacts = try container.decodeIfPresent([AddContactDto].self, forKey: .contacts) ?? []
    }
    
    // MARK: - Encodable Implementation
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
        try container.encode(date, forKey: .date)
        try container.encode(contactIds, forKey: .contactIds)
        try container.encode(contacts, forKey: .contacts)
    }
    
}
