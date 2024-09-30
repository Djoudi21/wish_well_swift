//
//  HomeViewModel.swift
//  SwiftTemplate
//
//  Created by Abdelkrim Djoudi on 29/09/2024.
//

import Foundation
import Combine


protocol Gift {
    var id: String { get }
    var name: String { get }
    var picture: String { get }
    var price: Double { get }
}

struct UpcomingBirthday: Identifiable {
    var id: String
    var userName: String
    var userAvatar: String
    var userBirthdayCountdown: Date
}

struct RecentGift: Identifiable, Gift {
    var id: String
    var name: String
    var picture: String
    var price: Double // Changed from Numeric to Double
    var dateReceived: Date
}

struct SuggestedGift: Identifiable, Gift {
    var id: String
    var name: String
    var picture: String
    var price: Double
    var description: String
}


class HomeViewModel: ObservableObject {
    @Published var upcomingBirthdays: [UpcomingBirthday] = [
        UpcomingBirthday(id: "1", userName: "Alice",userAvatar: "", userBirthdayCountdown: Date()),
        UpcomingBirthday(id: "2", userName: "Alice",userAvatar: "", userBirthdayCountdown: Date()),
        UpcomingBirthday(id: "3", userName: "Alice",userAvatar: "", userBirthdayCountdown: Date()),
        UpcomingBirthday(id: "4", userName: "Alice",userAvatar: "", userBirthdayCountdown: Date()),
        UpcomingBirthday(id: "5", userName: "Alice",userAvatar: "", userBirthdayCountdown: Date()),
        UpcomingBirthday(id: "6", userName: "Alice",userAvatar: "", userBirthdayCountdown: Date()),
        UpcomingBirthday(id: "7", userName: "Alice",userAvatar: "", userBirthdayCountdown: Date()),
    ]
    @Published var recentGifts: [RecentGift] = [
        RecentGift(id:"1", name: "Gift 1",picture: "", price: 20.0, dateReceived: Date()),
        RecentGift(id:"2", name: "Gift 1", picture: "", price: 20.0, dateReceived: Date()),
        RecentGift(id:"3", name: "Gift 1", picture: "", price: 20.0, dateReceived: Date()),
        RecentGift(id:"4", name: "Gift 1", picture: "", price: 20.0, dateReceived: Date()),
        RecentGift(id:"5", name: "Gift 1", picture: "", price: 20.0, dateReceived: Date()),
        RecentGift(id:"6", name: "Gift 1", picture: "", price: 20.0, dateReceived: Date()),
        RecentGift(id:"7", name: "Gift 1", picture: "", price: 20.0, dateReceived: Date()),
        RecentGift(id:"8", name: "Gift 1", picture: "", price: 20.0, dateReceived: Date()),
    ]
    @Published var suggestedGifts: [SuggestedGift] = [
        SuggestedGift(id:"1", name: "Gift 1",picture: "", price: 20.0, description: "sdf"),
        SuggestedGift(id:"2", name: "Gift 1", picture: "", price: 20.0, description: "qsdqds")
    ]
    
    
    func formattedPrice(for gift: Gift) -> String {
            return formatPrice(gift.price)
        }
}
