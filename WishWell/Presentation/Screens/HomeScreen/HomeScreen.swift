//
//  HomeScreen.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = HomeViewModel()

    @State private var items3 = ["Item 1", "Item 2", "Item 4", "Item 5"]

    @State private var upcomingBirthdaysSectionTitle =  "Upcoming Birthdays"
    @State private var recentGiftsSectionTitle =  "Recent gifts"
    @State private var giftSuggestionsSectionTitle =  "Suggested gifts"
   
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Spacer()

                HomeScreenUpcomingBirthdaysSection(upcomingBirthdays: viewModel.upcomingBirthdays, upcomingBirthdaysSectionTitle: $upcomingBirthdaysSectionTitle)
                Spacer()
                HomeScreenRecentGiftsSection(viewModel: viewModel.recentGifts, recentGiftsSectionTitle: $recentGiftsSectionTitle)
                Spacer()

                HomeScreenGiftSuggestionsSection(viewModel: viewModel.suggestedGifts, giftSuggestionsSectionTitle: $giftSuggestionsSectionTitle)
                Spacer()

                HomeScreenAddContactCta()
                Spacer()

            }.padding().navigationTitle("").toolbar {
                  ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Your button action here
                        print("Button tapped")
                    }) {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}
