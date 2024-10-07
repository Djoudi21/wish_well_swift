//
//  ContactFormScreen.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 02/10/2024.
//

import SwiftUI

struct ContactFormScreen: View {
    @EnvironmentObject var viewModel: ContactViewModel
    @State private var name: String = ""
    @State private var relationship: RelationshipType = .family
    @State private var birthday: Date = Date()
    @State private var selectedRelationshipOption = "Famille"

    var body: some View {
        ContactForm(name: $name, relationship: $relationship, birthday: $birthday, selectedRelationshipOption: $selectedRelationshipOption)
        
        CustomButton(label: "Submit") {
            Task {
               let newContactValues = NewContactFormValues(
                   name: name,
                   relationship: relationship,
                   birthday: birthday
               )
              try await viewModel.addContact(using: newContactValues)
           }
        }
    }
}

#Preview {
    ContactFormScreen()
}
