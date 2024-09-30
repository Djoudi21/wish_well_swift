//
//  ContactsFiltersSection.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 30/09/2024.
//

import SwiftUI

struct ContactsFiltersSection: View {
    @State private var selectedOption = "Famille"
    
    let options = ["Famille", "Amis", "Collegues"]
    var body: some View {
        HStack {
            Picker("Select an Group", selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }.pickerStyle(MenuPickerStyle()) // Make it look like a dropdown
        }
    }
}

#Preview {
    ContactsFiltersSection()
}
