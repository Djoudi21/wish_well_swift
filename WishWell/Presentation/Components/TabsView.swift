//
//  TabsView.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import SwiftUI

struct TabsView: View {
    // Use a state variable to track the selected tab
    @State private var selectedTab = 2 // Default to the first tab (Calendar)
    
    var body: some View {
                TabView(selection: $selectedTab) {
                    HomeScreen()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }.tag(2)
                    ContactsScreen()
                        .tabItem {
                            Label("Contacts", systemImage: "person.3")
                        }.tag(0)
                    GiftsScreen()
                        .tabItem {
                            Label("Gifts", systemImage: "gift")

                        }.tag(3)
                    EventsScreen()
                        .tabItem {
                            Label("Events", systemImage: "fireworks")

                        }.tag(4)
                    SettingsScreen()
                        .tabItem {
                            Label("Settings", systemImage: "gear")
                        }.tag(5)
                }
            }
}

#Preview {
    TabsView()
}
