//
//  EventRepositoryProtocol.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 04/10/2024.
//

import Foundation

protocol EventRepositoryProtocol {
    func fetchAllEvents() async throws -> [FetchEventDto]
    func addEvent(_ event: AddEventDto) async throws -> Void
}
