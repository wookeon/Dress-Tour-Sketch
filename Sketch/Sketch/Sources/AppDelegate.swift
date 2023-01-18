//
//  AppDelegate.swift
//  Sketch
//
//  Created by ernie on 2023/01/17.
//

import UIKit

@_exported import Then


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let sketchViewController = SketchViewController()
        let navigationController = UINavigationController(rootViewController: sketchViewController)
        
        self.window = window
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
