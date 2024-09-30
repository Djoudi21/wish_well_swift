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
