//
//  AddContactDto.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation

class AddContactDto: Codable, CustomStringConvertible {
    let name: String
    let birthday: Date
    let interests: [String]
    let relationship: RelationshipType
    
    // Define how this struct will be printed
     var description: String {
         return "AddContactDto(name: \(name), birthday: \(birthday), interests: \(interests), relationship: \(relationship))"
     }
    
    init(name: String, birthday: Date, interests: [String], relationship: RelationshipType) {
        self.name = name
        self.birthday = birthday
        self.interests = interests
        self.relationship = relationship
    }
    
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case name
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
    }
}
