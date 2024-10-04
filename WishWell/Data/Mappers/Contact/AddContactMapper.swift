//
//  AddContactMapper.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 03/10/2024.
//

import Foundation

class AddContactMapper {
    func toDto(_ formValues: NewContactFormValues) -> AddContactDto {
        return AddContactDto(
            name: formValues.username,
            email: "a@ssa.com",
            birthday: formValues.birthday,
            interests: [],
            relationship: formValues.relationship
        )
    }
}
