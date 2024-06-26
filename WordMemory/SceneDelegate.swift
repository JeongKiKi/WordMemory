//
//  SceneDelegate.swift
//  WordMemory
//
//  Created by 정기현 on 2024/04/09.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // 화면전환을 위해 추가
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let mainVC = UINavigationController(rootViewController: MainViewController())
        let listVC = UINavigationController(rootViewController: ListViewController())
        let testVC = UINavigationController(rootViewController: TestViewController())
        let tabBar = UITabBarController()
        tabBar.setViewControllers([mainVC, listVC, testVC], animated: true)

        let searchImage = UIImage(systemName: "magnifyingglass.circle")
        let wordImage = UIImage(systemName: "book")
        let testImage = UIImage(systemName: "pencil")

        if let item = tabBar.tabBar.items {
            item[0].title = "검색"
            item[0].image = searchImage
            item[1].title = "단어장"
            item[1].image = wordImage
            item[2].title = "시험"
            item[2].image = testImage
        }
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
