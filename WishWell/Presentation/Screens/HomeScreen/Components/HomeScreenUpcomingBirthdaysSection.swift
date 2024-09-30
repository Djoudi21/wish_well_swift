//
//  HomeScreenSection.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import SwiftUI

struct HomeScreenUpcomingBirthdaysSection: View {
    var upcomingBirthdays: [UpcomingBirthday]
    @Binding var upcomingBirthdaysSectionTitle: String

    var body: some View {
        HStack {
            Text(upcomingBirthdaysSectionTitle)
                .font(.headline)
       }
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 16) {
              ForEach(upcomingBirthdays, id: \.self.id) { birthday in
                  VStack {
                      ZStack(alignment: .topTrailing) {
                          Image(systemName: "person.fill").resizable()
                              .scaledToFit()
                              .clipShape(Circle())  .padding()
                              .frame(width: 100, height: 100)
                              .background(Color.red.opacity(0.2))
                              .cornerRadius(60)
                          
                          // Calculate days left
                          let daysLeft = daysUntil(birthdayDate: birthday.userBirthdayCountdown)
                        
                          // Badge overlay with GeometryReader to adjust size based on content
                          GeometryReader { geometry in
                              let badgeWidth = max(20, geometry.size.width) // Ensure minimum width
                              Circle()
                                  .fill(Color.red)
                                  .frame(width: badgeWidth, height: 30) // Set the height to 20
                                  .overlay(
                                      Text("\(daysLeft)")
                                          .font(.caption)
                                          .fontWeight(.bold)
                                          .foregroundColor(.white)
                                  )
                                  .offset(x: 5, y: -5) // Adjust position of the badge
                          }
                          .frame(width: 40, height: 20) // Provide a fixed frame for the GeometryReader
                      }
                      Text(birthday.userName)
                          .font(.subheadline)
                          .padding(.top, 2)
                  }.padding(.top, 20)
              }
          }
          .padding(.horizontal)
      }
    }
    
    // Function to calculate days until the birthday
    private func daysUntil(birthdayDate: Date) -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Get the difference in days
        if let days = calendar.dateComponents([.day], from: currentDate, to: birthdayDate).day {
            return days < 0 ? 0 : days // Return 0 if the birthday is in the past
        }
        return 0
    }
}

#Preview {
    HomeScreenUpcomingBirthdaysSection(upcomingBirthdays: [
        UpcomingBirthday(id: "1", userName: "Alice", userAvatar: "", userBirthdayCountdown: Date()),
        UpcomingBirthday(id: "2", userName: "Bob", userAvatar: "", userBirthdayCountdown: Date())
    ], upcomingBirthdaysSectionTitle: .constant("Upcoming birthdays"))
}
