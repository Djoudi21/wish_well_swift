//
//  SettingsScreen.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import SwiftUI

struct SettingsScreen: View {
    @State private var notificationsEnabled: Bool = true
    @State private var selectedTheme: String = "Light"

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("General")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    VStack(alignment: .leading) {
                        Text("Theme")
                        Picker("Theme", selection: $selectedTheme) {
                            Text("Light").tag("Light")
                            Text("Dark").tag("Dark")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                Section(header: Text("Account")) {
                    NavigationLink(destination: AccountScreen()) {
                        Text("Manage account")
                    }
                    
                    NavigationLink(destination:  PrivacyPolicyScreen()) {
                        Text("Privacy Policy")
                    }
                }
                
                Section(header: Text("About")) {
                                   Text("Version 1.0")
                                   Text("Wish well")
                               }
            }.navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsScreen()
}
