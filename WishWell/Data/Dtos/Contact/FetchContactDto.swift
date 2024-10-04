//
//  FetchContactDto.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation

class FetchContactDto: Codable {
    var id: UUID
    var name: String
    var email: String
    var birthday: Date
    var interests: [String]
    var relationship: RelationshipType
    var lastGift: String
    var createdAt: Date
    var updatedAt: Date
    var userId: UUID
    
    init(id: UUID, name: String, email: String, birthday: Date, interests: [String], relationship: RelationshipType, lastGift: String?, createdAt: Date, updatedAt: Date, userId: UUID) {
        self.id = id
        self.name = name
        self.email = email
        self.birthday = birthday
        self.interests = interests
        self.relationship = relationship
        self.lastGift = lastGift ?? ""
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userId = userId
    }
    
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case birthday
        case interests
        case relationship
        case lastGift
        case createdAt
        case updatedAt
        case userId
    }
    
    // MARK: - Decodable Implementation
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        email = try container.decode(String.self, forKey: .email)
        birthday = try container.decode(Date.self, forKey: .birthday)
        interests = try container.decode([String].self, forKey: .interests)
        relationship = try container.decode(RelationshipType.self, forKey: .relationship)
        
        // Safely decode lastGift as optional
        lastGift = try container.decodeIfPresent(String.self, forKey: .lastGift) ?? ""
        
        createdAt = try container.decode(Date.self, forKey: .createdAt)
        updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        
        let userIdString = try container.decode(String.self, forKey: .userId)
        userId = UUID(uuidString: userIdString) ?? UUID() // Convert String to UUID, fallback to a new UUID if it fails
    }
}
