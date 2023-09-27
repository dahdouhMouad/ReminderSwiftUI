//
//  ReminderToggleStyle.swift
//  ReminderSwiftUI
//
//  Created by Macbook Pro on 27/9/2023.
//

import SwiftUI

struct ReminderToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "largecircle.fill.circle"
                  : "circle")
            .resizable()
            .frame(width: 24,height: 24)
            .foregroundColor(configuration.isOn ? .accentColor : .gray)
            .onTapGesture {
                configuration.isOn.toggle()
            }
            .animation(.default, value: configuration.isOn)
            //To display whatever view the user passes in this parameter,
            //just insert configuration.label where you want to place it
            configuration.label
        }
    }
}

struct ReminderToggleStyle_Previews: PreviewProvider {
    struct Container: View {
        @State var isOn: Bool = false
        
        var body: some View {
            VStack {
                Toggle(isOn: $isOn) {
                    Text("Test")
                }
                .toggleStyle(.reminder)
            }
        }
    }
    
    static var previews: some View {
        Container()
    }
}

extension ToggleStyle where Self == ReminderToggleStyle {
  static var reminder: ReminderToggleStyle {
    ReminderToggleStyle()
  }
}
