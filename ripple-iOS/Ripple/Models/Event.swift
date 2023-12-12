//
//  Event.swift
//  Ripple
//
//  Created by Artemiy Malyshau on 11/12/2023.
//

import Foundation

struct Event: Identifiable, Hashable {
    var name: String
    var imageUrl: String
    var timeAndDate: String
    var type: eventType
    var id = UUID()
}


enum eventType {
    case past
    case upcoming
}
