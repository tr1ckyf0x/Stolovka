//
//  AppDelegate.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 05.01.2022.
//

import UIKit
import SharedResources
import SmokersStolovka

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // swiftlint:disable:next discouraged_optional_collection
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        let tabBarController = UITabBarController()
        window.rootViewController = tabBarController

        var viewControllers = [UIViewController]()

        let nikitaViewController = StolovkaMainScreenBuilder.buildStolovkaMainScreen()
        nikitaViewController.tabBarItem.title = SharedResources.L10n.nikitaScreenTitle
        nikitaViewController.tabBarItem.image = UIImage(asset: SharedResources.Asset.Assets.plankton)?.withRenderingMode(.alwaysOriginal)
        let nikitaNavigationController = UINavigationController(rootViewController: nikitaViewController)
        viewControllers.append(nikitaNavigationController)

        tabBarController.setViewControllers(viewControllers, animated: false)

        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}
