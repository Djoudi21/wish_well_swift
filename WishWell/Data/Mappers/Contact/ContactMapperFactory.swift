//
//  ContactMapperFactory.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation

protocol Mapper {
    associatedtype T
    
    func toEntity(_ data: T) -> ContactEntity
    func toDto(_ entity: ContactEntity) -> T
}

class ContactMapperFactory {
    private static var mappers: [String: AnyContactMapper] = [
        "fetch-contact": AnyContactMapper(FetchContactMapper()),
    ]
    
   static func getMapper(forKey key: String) -> AnyContactMapper? {
       return mappers[key]
   }
}
