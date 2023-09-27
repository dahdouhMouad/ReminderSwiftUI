//
//  ReminderViewModel.swift
//  ReminderSwiftUI
//
//  Created by Macbook Pro on 27/9/2023.
//

import Foundation
import Combine
import Factory

class ReminderListViewModel : ObservableObject {
    @Published var reminders = [Reminder]()
    
    
    // MARK: - Dependencies
    @Injected(\.remindersRepository) private
    var remindersRepository: RemindersRepository
    
    @Published var errorMessage: String?
    
    
    init() {
       remindersRepository
         .$reminders
         .assign(to: &$reminders)
     }
    
    func addReminder(_ reminder: Reminder) {
        do {
            try remindersRepository.addReminder(reminder)
            errorMessage = nil
        } catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func updateReminder(_ reminder: Reminder) {
        do {
          try remindersRepository.updateReminder(reminder)
        }
        catch {
          print(error)
          errorMessage = error.localizedDescription
        }
      }


    func setCompleted(_ reminder: Reminder, isCompleted: Bool) {
        var editedReminder = reminder
        editedReminder.isCompleted = isCompleted
        updateReminder(editedReminder)
      }
    
    func deleteReminder(_ reminder: Reminder) {
        remindersRepository.removeReminder(reminder)
    }
}
