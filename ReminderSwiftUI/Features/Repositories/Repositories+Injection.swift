//
//  Repositories+Injection.swift
//  ReminderSwiftUI
//
//  Created by Macbook Pro on 27/9/2023.
//

import Foundation
import Factory


extension Container {
  public var remindersRepository: Factory<RemindersRepository> {
    self {
      RemindersRepository()
    }.singleton
  }
}
