//
//  HomeScreen.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var viewModel: HomeViewModel

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Spacer()

                HomeScreenUpcomingEventsSection(upcomingEvents: $viewModel.upcomingEvents)
                Spacer()
                HomeScreenRecentGiftsSection(viewModel: $viewModel.recentGifts)
                Spacer()

                HomeScreenGiftSuggestionsSection(viewModel: $viewModel.suggestedGifts)
                Spacer()

                HomeScreenAddContactCta()
                Spacer()

            }.padding().navigationTitle("").toolbar {
                  ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .task {
           do {
               // Assuming your viewModel has an async method to fetch contacts
               try await viewModel.fetchAllEvents()
           } catch {}
       }
    }
}

#Preview {
    HomeScreen()
}
