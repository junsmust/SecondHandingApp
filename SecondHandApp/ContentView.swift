//
//  ContentView.swift
//  SecondHandApp
//
//  Created by 임주영 on 2024/02/15.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var isCompleted: Bool = false
    
    var body: some View {
        NavigationView {
            if isCompleted {
                MainView()
            }
            else {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                            isCompleted = true
                        }
                    }
            }
        }
    }
}
#Preview {
    ContentView()
}
