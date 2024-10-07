//
//  FetchContactDto.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation

class FetchContactDto: Decodable {
    var id: UUID
    var name: String
    var birthday: Date
    var relationship: RelationshipType
    var interests: [String]
    var createdAt: Date
    var updatedAt: Date
    var nextEvent: EventEntity?
    
    init(id: UUID, name: String, birthday: Date, interests: [String], relationship: RelationshipType, createdAt: Date, updatedAt: Date, nextEvent: EventEntity?) {
        self.id = id
        self.name = name
        self.birthday = birthday
        self.interests = interests
        self.relationship = relationship
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.nextEvent = nextEvent ?? nil
    }
    
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case birthday
        case interests
        case relationship
        case lastGift
        case createdAt
        case updatedAt
        case userId
        case nextEvent
    }
    
    // MARK: - Decodable Implementation
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        birthday = try container.decode(Date.self, forKey: .birthday)
        interests = try container.decode([String].self, forKey: .interests)
        relationship = try container.decode(RelationshipType.self, forKey: .relationship)
        
        createdAt = try container.decode(Date.self, forKey: .createdAt)
        updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        nextEvent = try container.decodeIfPresent(EventEntity.self, forKey: .nextEvent) ?? nil
    }
}
