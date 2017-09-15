//
//  AppDelegate.swift
//  InstagramAccelerator
//
//  Created by OminextMobile on 9/13/17.
//  Copyright © 2017 OminextMobile. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    
    
    let tabBar = TabBarController()
    let vcHome = HomeController()
    let vcSearch = SearchController()
    let vc = ViewController()
    let vcLike = LikeController()
    let vcProfile = ProfileController()
    
    vcHome.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "home"), tag: 0)
    vcSearch.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "search"), tag: 1)
    vc.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "add"), tag: 2)
    vcLike.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "like"), tag: 3)
    vcProfile.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "cursor1"), tag: 4)
    let navVC = UINavigationController(rootViewController: vc)
    tabBar.viewControllers = [vcHome,vcSearch,navVC,vcLike,vcProfile]
    tabBar.tabBar.tintColor = .black
    
    window?.rootViewController = tabBar
    
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

