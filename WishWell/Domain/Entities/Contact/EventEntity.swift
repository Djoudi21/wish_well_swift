//
//  EventEntity.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation

enum EventType: String, CaseIterable, Identifiable, Codable {
    case birthday = "Birthday"
    
    var id: String { self.rawValue }
}

struct EventEntity: Identifiable, Codable {
    var id: String
    var type: EventType
    var date: Date
}
