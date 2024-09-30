//
//  TotoView.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 30/09/2024.
//

import SwiftUI

struct GiftOverviewView<GiftType: Gift>: View {
    @Binding var iconName: String
    var gift: GiftType
    var body: some View {
        VStack {
            ZStack {
                Image(systemName: iconName).resizable()
                    .scaledToFit()
                    .clipShape(Rectangle())
                    .padding()
                    .frame(width: 100, height: 100)
                    .background(Color.red.opacity(0.2))
                    .cornerRadius(10)
                GeometryReader { geometry in
                    let badgeWidth = max(20, geometry.size.width) // Ensure minimum width
                    Circle()
                        .fill(Color.red)
                        .frame(width: badgeWidth, height: 30) // Set the height to 20
                        .overlay(
                          Text(formatPrice(gift.price))
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        )
                        .offset(x: 50, y: -50) // Adjust position of the badge
                }
                .frame(width: 40, height: 20) // Provide a fixed frame for the GeometryReader
            }
            Text(gift.name)
                .font(.subheadline)
        }.padding(.top, 20)    }
}

#Preview {
    // Create an example conforming to Gift protocol
    let recentGift = RecentGift(id: "1", name: "Gift 1", picture: "", price: 20.0, dateReceived: Date())
    let suggestedGift = SuggestedGift(id: "2", name: "Gift 2", picture: "", price: 20.0, description: "A great suggestion")
    GiftOverviewView(iconName: .constant("person.fill"), gift: recentGift)
}
