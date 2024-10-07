//
//  DateFormatterUtils.swift
//  WishWell
//
//  Created by Abdelkrim Djoudi on 01/10/2024.
//

import Foundation

// Method to format the date
func formatDate(_ date: Date) -> String {
     let formatter = DateFormatter()
     formatter.dateStyle = .medium // Set the date style
     formatter.timeStyle = .none // Set the time style, if you want to omit it
     return formatter.string(from: date)
 }

func daysUntil(eventDate: Date) -> Int {
    let calendar = Calendar.current
    let currentDate = Date()
    
    // Get the difference in days
    if let days = calendar.dateComponents([.day], from: currentDate, to: eventDate).day {
        return days < 0 ? 0 : days // Return 0 if the birthday is in the past
    }
    return 0
}
