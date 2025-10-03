//
//  ContentView.swift
//  ShoppingCartAssignment
//
//  Created by Zhasmin Suleimenova on 02.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var didRun = false
        var body: some View {
            Text("ShoppingCart Assignment")
                .onAppear {
                    if !didRun {
                        didRun = true
                        runScenarios()
                    }
                }
        }
}

#Preview {
    ContentView()
}
