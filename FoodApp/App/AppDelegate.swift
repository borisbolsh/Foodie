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

    // TODO: - Change to coordinator
    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    UINavigationBar.appearance().shadowImage = UIImage()
    UINavigationBar.appearance().tintColor = .black

    IQKeyboardManager.shared.enable = true
    IQKeyboardManager.shared.shouldResignOnTouchOutside = true

    let navController = UINavigationController(rootViewController: HomeViewController())

    window?.rootViewController = navController
    window?.makeKeyAndVisible()
    return true
  }

}

