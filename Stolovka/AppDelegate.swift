//
//  AppDelegate.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 05.01.2022.
//

import UIKit
import Swinject
import SharedResources
import MainScreen
import UsernameProvider
import QuoteOfTheDayProvider
import OldsRecommendedProductsProvider
import SmokersStolovka

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var assemblies: [Assembly] = [
        MainScreenAssembly(),
        UsernameProviderAssembly(),
        QuoteOfTheDayProviderAssembly(),
        OldsRecommendedProductsProviderAssembly()
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

