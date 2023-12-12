//
//  Society.swift
//  Ripple
//
//  Created by Artemiy Malyshau on 11/12/2023.
//

import Foundation

struct Society: Identifiable, Hashable {
    var name: String
    var imageUrl: String
    var type: societyType
    var description: String
    var memberCount: Int?
    var address: String
    var loyalty: Loyalty
    var joined: Bool
    var sessions: [Event]?
    var id =  UUID()
}

enum societyType: String {
    case universityClub = "University Club"
    case sportsClub = "Sports Club"
    case society = "Society"
    case cafe = "Cafe"
    case restaurant = "Restaurant"
}

var societies: [Society] = [
    Society(name: "Imperial College Robotics Society", imageUrl: "icrs", type: .universityClub, description: "Learn, Make, Meet, Hack and Compete at the Imperial College Robotics Society!", memberCount: 348, address: "Imperial College London EEE Building", loyalty: Loyalty(total: 0, received: 0, complete: false), joined: true, sessions: [
        Event(name: "Line follower competition", imageUrl: "line", timeAndDate: "16:00, 14.12.2023", type: .upcoming),
        Event(name: "Rover session", imageUrl: "mars", timeAndDate: "16:00, 16.12.2023", type: .upcoming),
        Event(name: "Sensors and actuators", imageUrl: "sensors", timeAndDate: "18:00, 20.12.2023", type: .upcoming),
    ]),
    Society(name: "North Greenwich FC", imageUrl: "ngfc", type: .universityClub, description: "We are a football club for children aged 3 to 18 based in Greenwich Peninsula, North Greenwich. The club has 2 different sides : a grassroots side playing the Selkent League and an Academy side playing the Junior Premier League.", memberCount: 102, address: "North Greenwich FC Training Ground", loyalty: Loyalty(total: 0, received: 0, complete: false), joined: true, sessions: [
        Event(name: "Monday training session", imageUrl: "football", timeAndDate: "16:00, 11.12.2023", type: .upcoming),
        Event(name: "Wednesday training session", imageUrl: "football", timeAndDate: "16:00, 13.12.2023", type: .upcoming),
        Event(name: "Friday training session", imageUrl: "football", timeAndDate: "18:00, 15.12.2023", type: .upcoming),
    ])
]

var loyalties: [Society] = [
    Society(name: "Ole & Steen", imageUrl: "olesteen", type: .cafe, description: "The all-day bakery from Denmark. Our bakeries across London and Oxford bring our passion for uncompromising quality, innovation and taste to the UK.", memberCount: 25251, address: "Any Ole & Steen branch in the UK", loyalty: Loyalty(total: 5, received: 7, complete: false), joined: true),
    Society(name: "Honest Burgers", imageUrl: "honest", type: .restaurant, description: "The all-day bakery from Denmark. Our bakeries across London and Oxford bring our passion for uncompromising quality, innovation and taste to the UK.", memberCount: 25251, address: "Any Ole & Steen branch in the UK", loyalty: Loyalty(total: 5, received: 7, complete: false), joined: true)
]

var boughtMembership = false

var preSocieties: [Society] = [
    Society(name: "North Greenwich FC", imageUrl: "ngfc", type: .universityClub, description: "We are a football club for children aged 3 to 18 based in Greenwich Peninsula, North Greenwich. The club has 2 different sides : a grassroots side playing the Selkent League and an Academy side playing the Junior Premier League.", memberCount: 102, address: "North Greenwich FC Training Ground", loyalty: Loyalty(total: 0, received: 0, complete: false), joined: true, sessions: [
        Event(name: "Monday training session", imageUrl: "football", timeAndDate: "16:00, 11.12.2023", type: .upcoming),
        Event(name: "Wednesday training session", imageUrl: "football", timeAndDate: "16:00, 13.12.2023", type: .upcoming),
        Event(name: "Friday training session", imageUrl: "football", timeAndDate: "18:00, 15.12.2023", type: .upcoming),
    ])
]

var roboticsSocieties: [Society] = [
    Society(name: "Imperial College Robotics Society", imageUrl: "icrs", type: .universityClub, description: "Learn, Make, Meet, Hack and Compete at the Imperial College Robotics Society!", memberCount: 348, address: "Imperial College London EEE Building", loyalty: Loyalty(total: 0, received: 0, complete: false), joined: false, sessions: [
        Event(name: "Line follower competition", imageUrl: "line", timeAndDate: "16:00, 14.12.2023", type: .upcoming),
        Event(name: "Rover session", imageUrl: "mars", timeAndDate: "16:00, 16.12.2023", type: .upcoming),
        Event(name: "Sensors and actuators", imageUrl: "sensors", timeAndDate: "18:00, 20.12.2023", type: .upcoming),
    ])
]
