//
//  EventsView.swift
//  Event Countdown
//
//  Created by Jean on 26/08/24.
//

import SwiftUI

struct EventsView: View {
    @State private var events: [Event] = Event.all
    @State private var showEventForm = false
    
    
    var body: some View {
        NavigationStack {
            List(events, id: \.self) {
                event in
                NavigationLink() {
                    EventForm(events: $events, eventToEdit: event, onSave: { _ in   })
                } label: {
                    EventRow(event: event)
                    
                }
                .swipeActions {
                    Button("Delete"){
                        if let index = events.firstIndex(of: event) {
                            events.remove(at: index)
                        }
                    }
                    .tint(.red)
                }
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showEventForm = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(isPresented: $showEventForm) {
                EventForm(events: $events, onSave: { _ in   })
            }
        }
    }
}


#Preview {
    NavigationStack {
        EventsView()
    }
}
