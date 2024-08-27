//
//  EventForm.swift
//  Event Countdown
//
//  Created by Jean on 26/08/24.
//

import SwiftUI

struct EventForm: View {
    @Binding var events: [Event]
    @Environment(\.dismiss) var dismiss
    @State private var event: Event
    var onSave: (Event) -> Void
    
    
    init(events: Binding<[Event]>, eventToEdit: Event? = nil, onSave: @escaping (Event) -> Void) {
        self._events = events
        self._event = State(initialValue: eventToEdit ?? Event(title: "", date: Date.now, textColor: .red))
        self.onSave = onSave
    }
    var body: some View {
        NavigationStack{
            Form{
                Section {
                    TextField("Title", text: $event.title).fontWeight(.bold)
                        .foregroundColor(event.textColor)
                    DatePicker("Date", selection: $event.date, displayedComponents: .date)
                    ColorPicker("Text Color", selection: $event.textColor)
                }
            }
            
            .navigationTitle(event.title.isEmpty ? "New Event" : "Edit Event")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        guard !event.title.isEmpty else {
                            return
                        }
                        if let index = events.firstIndex(where: { $0.id == event.id }) {
                            events[index] = event
                        } else {
                            events.append(event)
                            onSave(event)
                        }
                        dismiss()
                    }
                    .disabled(event.title.isEmpty)
                }}}
    }
}

#Preview {
    NavigationStack{
        EventForm(events: .constant([Event.event1, Event.event2, Event.event3]), onSave: { _ in }) 
    }
}
