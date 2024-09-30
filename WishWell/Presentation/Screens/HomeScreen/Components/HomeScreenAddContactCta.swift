//
//  HomeScreenAddContactCta.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import SwiftUI

struct HomeScreenAddContactCta: View {
    @State private var label: String = "Add contact"
    var body: some View {
        CustomButton(label: $label) {
            print("TOTO")
        }
    }
}

#Preview {
    HomeScreenAddContactCta()
}
