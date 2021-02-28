//
//  AppDelegate.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        start()
        return true
    }
    
    private func start() {
        window = UIWindow()
        let commitListCoordinator = CommitListCoordinator(withWindow: window)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: UIViewController())
        commitListCoordinator.start()
    }
}

