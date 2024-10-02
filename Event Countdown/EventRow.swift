//
//  EventRow.swift
//  Event Countdown
//
//  Created by Jean on 26/08/24.
//

import SwiftUI


struct EventRow: View {
    let event: Event
    @State private var whenDate: String = ""
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(event.title)
                .foregroundColor(event.textColor)
                .font(.title)
                .fontWeight(.bold)
            
            Text(whenDate)
                .font(.title2)
                .foregroundColor(.secondary)
        }
        .onAppear(perform: updateWhenDate)
        .onReceive(timer) { _ in
            updateWhenDate()
        }
    }
    
    
    private func updateWhenDate() {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        whenDate = formatter.localizedString(for: event.date, relativeTo: Date())
    }
}


#Preview {
    EventRow(event: Event(title: "Some Event ", date: Date.now.addingTimeInterval(16540), textColor: .green))
}
