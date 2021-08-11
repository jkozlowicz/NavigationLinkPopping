//
//  HomeView.swift
//  NavigationLinkPopping
//
//  Created by Jakub Kozlowicz on 11.08.21.
//

import SwiftUI


struct ProfileView: View {
    var body: some View {
        Text("ProfileView")
    }
}


struct SettingsView: View {
    var body: some View {
        Text("SettingsView")
    }
}


struct HomeNavBarItemsView: View {
    // The @Binding provided by the parent view and passed to isActive in one of the NavigationLinks is the problem
    // If the @Binding is changed to @State, the navigation no longer pops
    // Please note that the App entry point MUST be embedded in a TabBar for this problem to manifest itself
    // WindowGroup { HomeView() } doesn't have this problem...
    @Binding var isSettingsViewActive: Bool
//    @State private var isSettingsViewActive = false // <-- This will work
    @State private var isProfileViewActive = false
    
    var body: some View {
        HStack(spacing: 15) {
            NavigationLink(destination: SettingsView(), isActive: $isSettingsViewActive) {
                Image(systemName: "gearshape")
                    .font(.title3)
                    .padding(4)
            }

            NavigationLink(destination: ProfileView(), isActive: $isProfileViewActive) {
                Image(systemName: "person")
                    .font(.title3)
                    .padding(4)
            }
        }
    }
}


struct HomeView: View {
    @State private var isSettingsViewActive = false

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Text("Foobar")
            }
            .navigationTitle("Home")
//            .navigationBarItems(trailing: HomeNavBarItemsView()) // <-- This will work
            .navigationBarItems(trailing: HomeNavBarItemsView(isSettingsViewActive: $isSettingsViewActive))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
