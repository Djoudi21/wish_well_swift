//
//  CustomButton.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import SwiftUI

struct CustomButton: View {
    @Binding var label: String
    var action: () -> Void // Closure to hold the action
    var body: some View {
        Button(action: {
            action() // Call the action when the button is pressed
        }) {
            Text(label).frame(maxWidth: .infinity)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .padding()

    }
}

#Preview {
    CustomButton(label: .constant("Press"), action: {})
}
