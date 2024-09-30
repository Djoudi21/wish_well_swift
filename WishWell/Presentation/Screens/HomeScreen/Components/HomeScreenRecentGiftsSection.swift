//
//  HomeScreenRecentGiftsSection.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import SwiftUI

struct HomeScreenRecentGiftsSection: View {
    var viewModel: [RecentGift]
    @Binding var recentGiftsSectionTitle: String
    @State private var iconName: String = "gift.fill"
    var body: some View {
        HStack {
                Text(recentGiftsSectionTitle)
                    .font(.headline)
        }.padding(.horizontal)
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 16) {
              ForEach(viewModel, id: \.id) { recentGift in
                  GiftOverviewView(iconName: $iconName, gift: recentGift)
              }
          }
          .padding(.horizontal)
        }
    }
}

#Preview {
    HomeScreenRecentGiftsSection(viewModel:  [
        RecentGift(id:"1", name: "Gift 1",picture: "", price: 20.0, dateReceived: Date()),
        RecentGift(id:"2", name: "Gift 1", picture: "", price: 20.0, dateReceived: Date())
    ], recentGiftsSectionTitle: .constant("Recent gifts"))
}
