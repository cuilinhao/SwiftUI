//
//  AppDelegate.swift
//  WorldLandMark
//
//  Created by 崔林豪 on 2020/10/6.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		
		//返回一个名为“Default Configuration” 的UIScenceConfiguration 的实例
		//"Default configuration" 在 info.plist 的“ApplicationScenceMainfest -> Scenceconfigurations”中指定了 Delegate为 $(PRODUCT_MODULE_NAME).SceneDelegate
		//流程“ app启动-委托给ScenceDelegate-scence(_:willConnectTo:options:)被调用-开始UI
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}


}

