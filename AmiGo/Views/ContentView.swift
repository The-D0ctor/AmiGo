//
//  ContentView.swift
//  AmiGo
//
//  Created by Sébastien Rochelet on 24/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                SearchView()
                    .tabItem {
                        Label("Recherche", image: "magnifyingglass")
                    }
                MessagesView()
                    .tabItem {
                        Label("Messages", image: "message")
                    }
                ActivitiesView()
                    .tabItem {
                        Label("Activités", image: "dice")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profil", image: "person")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
