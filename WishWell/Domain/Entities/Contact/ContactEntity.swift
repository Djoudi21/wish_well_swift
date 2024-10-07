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
    var name: String
    var relationship: RelationshipType
    var events: [EventEntity]
    var nextEvent: EventEntity?
    
    init(
           id: UUID?,
           name: String,
           relationship: RelationshipType,
           events: [EventEntity] = [],
           nextEvent: EventEntity?
       ) {
           self.id = id
           self.name = name
           self.relationship = relationship
           self.events = events
           self.nextEvent = nextEvent
       }}
