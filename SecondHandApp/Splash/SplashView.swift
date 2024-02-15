//
//  SplashScreen.swift
//  SecondHandApp
//
//  Created by 임주영 on 2024/02/15.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Text("Splash View")
            ProgressView()
                .tint(.purple)
                .padding(.vertical, 10)
        }
    }
}

#Preview {
    SplashView()
}
