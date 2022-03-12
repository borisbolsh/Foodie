import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)

    if #available(iOS 13.0, *) {
      window?.backgroundColor = .systemBackground
    } else {
      window?.backgroundColor = .white
    }

    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    UINavigationBar.appearance().shadowImage = UIImage()
    UINavigationBar.appearance().tintColor = .black

    IQKeyboardManager.shared.enable = true
    IQKeyboardManager.shared.shouldResignOnTouchOutside = true

    var navController = UINavigationController()

    if UserDefaults.standard.hasOnboarded {
      navController = UINavigationController(rootViewController: HomeViewController())
    } else {
      navController = UINavigationController(rootViewController: OnboardingViewController())
    }

    window?.rootViewController = navController
    window?.makeKeyAndVisible()
    return true
  }

}

