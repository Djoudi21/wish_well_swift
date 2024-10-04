//
//  AddContactDto.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation

class AddContactDto: Codable {
    let name: String
    let email: String
    let birthday: Date
    let interests: [String]
    let relationship: RelationshipType
    
    init(name: String, email: String?, birthday: Date, interests: [String], relationship: RelationshipType) {
        self.name = name
        self.email = email ?? ""
        self.birthday = birthday
        self.interests = interests
        self.relationship = relationship
    }
    
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case name
        case email
        case birthday
        case interests
        case relationship
    }
    
    // MARK: - Decodable Implementation
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        birthday = try container.decode(Date.self, forKey: .birthday)
        interests = try container.decode([String].self, forKey: .interests)
        relationship = try container.decode(RelationshipType.self, forKey: .relationship)
        
        // Safely decode lastGift as optional
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
    }
}
