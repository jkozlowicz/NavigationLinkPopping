//
//  TabBarView.swift
//  NavigationLinkPopping
//
//  Created by Jakub Kozlowicz on 11.08.21.
//

import SwiftUI
import UIKit


struct UIKitTabView: View {
    var viewControllers: [UIHostingController<AnyView>]

    init(_ tabs: [Tab]) {
        self.viewControllers = tabs.map {
            let host = UIHostingController(rootView: $0.view)
            host.tabBarItem = $0.barItem
            return host
        }
    }

    var body: some View {
        TabBarController(controllers: viewControllers)
            .edgesIgnoringSafeArea(.all)

    }
}


struct Tab {
    var view: AnyView
    var barItem: UITabBarItem
    
    init<V: View>(view: V, barItem: UITabBarItem) {
        self.view = AnyView(view)
        self.barItem = barItem
        
    }
}

struct TabBarController: UIViewControllerRepresentable {
    var controllers: [UIViewController]

    func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        tabBarController.tabBar.backgroundImage = UIImage()
        tabBarController.tabBar.backgroundColor = .systemBackground
        tabBarController.selectedIndex = 0
        return tabBarController
    }

    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {

    }
}

struct TabBarView: View {
    var body: some View {
        UIKitTabView([
            Tab(
                view: HomeView(),
                barItem: UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
            )
        ])
    }
}



struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
