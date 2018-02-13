//
//  AppDelegate.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 09/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }

    private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()

    private func makeCoordinator() -> Coordinator {
        return ApplicationCoordinator(
            router: RouterImp(rootController: self.rootController),
            coordinatorFactory: CoordinatorFactoryImp()
        )
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        applicationCoordinator.start()
        return true
    }

}

