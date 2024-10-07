//
//  ContactsFiltersSection.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 30/09/2024.
//

import SwiftUI

struct ContactsFiltersSection: View {
    @EnvironmentObject var viewModel: ContactViewModel // Access the ViewModel from the environment
    @State private var selectedOption = "Famille"
    
    // Create a dictionary mapping labels to RelationshipType
   let options: [String: RelationshipType] = [
       "Famille": .family,
       "Amis": .friend,
       "Collegues": .colleague
   ]
    
    var body: some View {
        HStack {
            Picker("Select an Group", selection: $selectedOption) {
                ForEach(Array(options.keys), id: \.self) { label in
                    Text(label).tag(options[label])
                }
            }
            .pickerStyle(MenuPickerStyle())
            .onChange(of: selectedOption) { oldValue, newValue in
                let relationship = options[newValue] ?? .family
                viewModel.filterContactByRelationship(for: relationship)
            }
            
            CustomButton(label: "Reset") {
                 viewModel.resetFilters()
            }
        }.padding()
    }
}

#Preview {
    ContactsFiltersSection()
}
