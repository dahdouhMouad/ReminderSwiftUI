//
//  AddReminder.swift
//  ReminderSwiftUI
//
//  Created by Macbook Pro on 27/9/2023.
//

import SwiftUI

struct EditReminderDetailsView: View {

    
    enum FocusField : Hashable {
        case title
    }
    
    enum Mode {
        case add
        case edit
    }
    
    var mode : Mode = .add
    
    @State var reminder = Reminder(title: "")
    
    @FocusState
    private var focusField : FocusField?
    
    var onCommit: (_ reminder: Reminder) -> Void
    
    @Environment(\.dismiss)
     private var dismiss
    
    private func commit() {
        onCommit(reminder)
        dismiss()
    }
    
    private func cancel() {
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("", text: $reminder.title)
                    .focused($focusField, equals: .title)
                    .submitLabel(.done)
                    .onSubmit {
                        commit()
                    }
            }
            .navigationTitle(mode == .add ? "New Reminder" : "Edit Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        commit()
                    } label: {
                        HStack {
                            Text(mode == .add ? "Add" : "Done")
                                .foregroundColor(.accentColor)
                        }
                    }
                    .disabled(reminder.title.isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    HStack {
                        Button {
                            cancel()
                        } label: {
                            HStack{
                                Text("Cancel")
                            }
                        }

                    }
                }
            }
        }
        .onAppear {
            focusField  = .title
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        EditReminderDetailsView { reminder in
            print(reminder.title)
        }
      }
}
