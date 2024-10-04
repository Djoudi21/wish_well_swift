//
//  AnyContactMapper.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation

struct AnyContactMapper {
    private let _toEntity: (Any) -> ContactEntity
    private let _toDto: (ContactEntity) -> Any
    
    init<M: Mapper>(_ mapper: M) {
        _toEntity = { data in
            guard let data = data as? M.T else {
                fatalError("Invalid type for toEntity")
            }
            return mapper.toEntity(data)
        }
        _toDto = { entity in
            return mapper.toDto(entity)
        }
    }
    
    func toEntity(_ data: Any) -> ContactEntity {
        return _toEntity(data)
    }
    
    func toDto(_ entity: ContactEntity) -> Any {
        return _toDto(entity)
    }
}
