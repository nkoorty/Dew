//
//  TabBarView.swift
//  Ripple
//
//  Created by Artemiy Malyshau on 10/12/2023.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            BrowseView()
                .tabItem {
                    Label("Browse", systemImage: "square.stack.fill")
                }
            
            MembershipView()
                .tabItem {
                    Label("Memberships", systemImage: "lanyardcard")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.circle")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabBarView()
        .preferredColorScheme(.dark)
}
