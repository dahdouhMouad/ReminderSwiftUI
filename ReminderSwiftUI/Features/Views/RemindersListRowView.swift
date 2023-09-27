//
//  RemindersListRowView.swift
//  ReminderSwiftUI
//
//  Created by Macbook Pro on 27/9/2023.
//

import SwiftUI

struct RemindersListRowView: View {
    @Binding
    var reminder : Reminder
    
    var body: some View {
        HStack {
            Toggle("", isOn: $reminder.isCompleted)
                .toggleStyle(.reminder)
            Text(reminder.title)
            Spacer()
        }
        .contentShape(Rectangle())
        
    }
}

struct RemindersListRowView_Previews: PreviewProvider {
    struct Container: View {
        @State var reminder = Reminder.samples[0]
        var body: some View {
            //Make It Look like inside List
            List {
                RemindersListRowView(reminder: $reminder)
            }
            .listStyle(.plain)
            
        }
      }
    
    static var previews: some View {
        NavigationView {
            Container()
                .navigationTitle("Reminder")
        }
    }
}
