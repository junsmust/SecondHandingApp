//
//  MainView.swift
//  SecondHandApp
//
//  Created by 임주영 on 2024/02/15.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "message")
                }
            MyPageView()
                .tabItem {
                    Label("MyPage", systemImage: "person")
                }
        }
        .tint(.purple)
    }
}

#Preview {
    MainView()
}
