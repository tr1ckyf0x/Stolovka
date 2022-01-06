//
//  AppDelegate.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 05.01.2022.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var assemblies: [Assembly] = [
        MainScreenAssembly(),
        UsernameProviderAssembly(),
        QuoteOfTheDayAssembly()
    ]

    private lazy var assembler = Assembler(assemblies)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        let tabBarController = UITabBarController()
        window.rootViewController = tabBarController

        var viewControllers = [UIViewController]()

        if let mainViewController = assembler.resolver.resolve(
            UIViewController.self,
            name: MainScreenAssembly.Constants.viewControllerKey
        ) {
            let navigationController = UINavigationController(rootViewController: mainViewController)
            viewControllers.append(navigationController)
        }

        let nikitaViewController = ViewController()
        nikitaViewController.tabBarItem.title = L10n.Localized.nikitaScreenTitle
        nikitaViewController.tabBarItem.image = UIImage(sfSymbol: SFSymbol.person)
        let nikitaNavigationController = UINavigationController(rootViewController: nikitaViewController)
        viewControllers.append(nikitaNavigationController)

        tabBarController.setViewControllers(viewControllers, animated: false)

        self.window = window
        window.makeKeyAndVisible()

        return true
    }
}

