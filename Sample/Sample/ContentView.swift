//
//  ContentView.swift
//  Sample
//
//  Created by Cassius Pacheco on 13/10/2022.
//

import SwiftUI
import MyBinaryFramework

struct ContentView: View {
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Save") {
                try? MyBinaryFramework.save("Something", forKey: "key")
            }
            Button("Load") {
                let result = try? MyBinaryFramework.load(forKey: "key")
                print(String(describing: result))
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
