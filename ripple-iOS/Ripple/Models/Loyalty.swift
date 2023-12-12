//
//  Loyalty.swift
//  Ripple
//
//  Created by Artemiy Malyshau on 11/12/2023.
//

import Foundation

struct Loyalty: Identifiable, Hashable {
    var total: Int
    var received: Int
    var complete: Bool
    var id = UUID()
}

