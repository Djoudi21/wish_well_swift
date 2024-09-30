//
//  HomeScreenGiftSuggestionsSection.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import SwiftUI

struct HomeScreenGiftSuggestionsSection: View {
    var viewModel: [SuggestedGift]
    @Binding var giftSuggestionsSectionTitle: String
    @State private var iconName: String = "gift.fill"

    var body: some View {
        HStack {
                Text(giftSuggestionsSectionTitle)
                    .font(.headline)
        }.padding(.horizontal)
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 16) {
              ForEach(viewModel, id: \.id) { suggestedGift in
                  GiftOverviewView(iconName: $iconName, gift: suggestedGift)
              }
          }
          .padding(.horizontal)
        }
    }
}

#Preview {
    HomeScreenGiftSuggestionsSection(viewModel: [
        SuggestedGift(id:"1", name: "Gift 1",picture: "", price: 20.0, description: "sdf"),
        SuggestedGift(id:"2", name: "Gift 1", picture: "", price: 20.0, description: "qsdqds")
    ], giftSuggestionsSectionTitle: .constant("Suggested gifts"))
}
