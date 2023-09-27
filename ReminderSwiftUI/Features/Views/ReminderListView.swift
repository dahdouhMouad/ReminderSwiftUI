//
//  ReminderView.swift
//  ReminderSwiftUI
//
//  Created by Macbook Pro on 27/9/2023.
//

import SwiftUI

struct ReminderListView: View {
    @StateObject
    private var viewModel = ReminderListViewModel()
    
    @State
    private var isReminderDialogPresented = false
    
    @State
    private var editableReminder: Reminder? = nil

    private func presentAddReminderDialog() {
        isReminderDialogPresented.toggle()
    }
    
    
    var body: some View {
        NavigationStack {
            List($viewModel.reminders) { $reminder in
                RemindersListRowView(reminder: $reminder)
                    .swipeActions(edge: .trailing,allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            viewModel.deleteReminder(reminder)
                        } label: {
                            HStack {
                                Image(systemName: "trash")
                            }
                        }
                        .tint(.red)
                    }
                    .swipeActions(edge: .leading,allowsFullSwipe: true) {
                        Button {
                            editableReminder = reminder
                        } label: {
                            HStack {
                                Image(systemName: "pencil")
                            }
                        }
                        .tint(.green)

                    }
                    .onChange(of: reminder.isCompleted) { newValue in
                        viewModel.setCompleted(reminder, isCompleted: newValue)
                    }
                    .onTapGesture {
                        editableReminder = reminder
                    }
                    
                
            }
            .navigationTitle("Reminders")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                      presentAddReminderDialog()
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("New Reminder")
                            
                        }
                    }
                    .tint(.red)
                }
            }
        }
        .sheet(isPresented: $isReminderDialogPresented) {
            EditReminderDetailsView { reminder in
                viewModel.addReminder(reminder)
            }
        }
        .sheet(item: $editableReminder, content: { reminder in
            EditReminderDetailsView(mode: .edit,reminder: reminder) { reminder in
                viewModel.updateReminder(reminder)
            }
        })

        
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReminderListView()
                .navigationTitle("Reminders")
        }
    }
}

