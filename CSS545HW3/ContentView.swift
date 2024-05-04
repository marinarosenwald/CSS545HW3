//
//  ContentView.swift
//  CSS545HW3
//
//  Created by Mari Rosenwald on 5/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput: String = ""
    
    func saveUserInput() {
        UserDefaults.standard.set(userInput, forKey: "UserInput")
    }
    
    var body: some View {
        VStack {
            Text("Enter some text:")
            TextField("Type here", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("You entered: \(userInput)")
            
        }
        .padding()
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            saveUserInput()
        }
    }
}

#Preview {
    ContentView()
}

