//
//  AppDelegate.swift
//  dot-a
//
//  Created by yxgg on 03/06/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let window = UIWindow()
    let mainViewController = HomeViewController()
    let navigationController = UINavigationController(rootViewController: mainViewController)
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
    self.window = window
    return true
  }
  
  // MARK: UISceneSession Lifecycle
  func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
}
