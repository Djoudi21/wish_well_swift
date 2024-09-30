//
//  NumberFormatterUtils.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 30/09/2024.
//

import Foundation

// Utility function to format price as currency
func formatPrice(_ price: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency // Set the style to currency
    // Safely unwrap the currency code
     if let currencyCode = Locale.current.currency?.identifier {
         formatter.currencyCode = currencyCode // Set currency code based on locale
     } else {
         formatter.currencyCode = "EUR" // Fallback to a default currency code, e.g., USD
     }
    
    // Conditional formatting for fraction digits
       if price.truncatingRemainder(dividingBy: 1) == 0 {
           formatter.minimumFractionDigits = 0
           formatter.maximumFractionDigits = 0
       } else {
           formatter.minimumFractionDigits = 2
           formatter.maximumFractionDigits = 2
       }
    
    return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
}
