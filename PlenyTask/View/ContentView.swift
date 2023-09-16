//
//  ContentView.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/14/23.
//

import SwiftUI

struct ContentView: View {
    var view: String
    
    var body: some View {
        VStack {
            Text("Hello, from \(view) view 👋!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(view: "Content")
    }
}
