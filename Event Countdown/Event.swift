//
//  Event.swift
//  Event Countdown
//
//  Created by Jean on 26/08/24.
//

import Foundation

import SwiftUI

struct Event: Comparable, Identifiable, Hashable {
    let id = UUID()
    var title: String
    var date: Date
    var textColor: Color
    
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }}

extension Event {
    static var all: [Event] = [
        .event1,
        .event2,
        .event3
    ]
}
extension Event {
    static var event1 = Event(title: "event 1", date: Date.now.addingTimeInterval(33540), textColor: .red)
    static var event2 = Event(title: "event 2", date: Date.now.addingTimeInterval(16770), textColor: .green)
    static var event3 = Event(title: "event 3", date: Date.now.addingTimeInterval(1653450), textColor: .blue)
}


