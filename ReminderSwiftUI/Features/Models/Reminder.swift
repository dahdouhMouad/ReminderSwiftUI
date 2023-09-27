//
//  Reminder.swift
//  ReminderSwiftUI
//
//  Created by Macbook Pro on 27/9/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct Reminder: Identifiable,Codable {
    @DocumentID
    var id : String?
    var title: String
    var isCompleted = false
}

extension Reminder {
    static var samples =  [
        Reminder(title: "Build sample app", isCompleted: true),
        Reminder(title: "Create tutorial"),
        Reminder(title: "Mouad Reminder"),
        Reminder(title: "PROFIT!"),
      ]
}

extension Reminder {
  static let collectionName = "reminders"
}
