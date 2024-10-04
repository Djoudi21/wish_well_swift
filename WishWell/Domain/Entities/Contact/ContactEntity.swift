//
//  ContactEntity.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation

enum RelationshipType: String, CaseIterable, Identifiable, Codable {
    case family = "Family"
    case friend = "Friend"
    case colleague = "Collegue"

    var id: String { self.rawValue }
}

struct ContactEntity: Identifiable, Codable {
    var id: UUID?
    var username: String
    var email: String
    var relationship: RelationshipType
    var events: [EventEntity]
    var nextEvent: EventEntity
}
