import UIKit

final class HomeViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .yellow
    self.title = "Foodie"

    let button1 = UIBarButtonItem(
      image: UIImage(named: "cart"),
      style: .plain,
      target: self,
      action: #selector(cartTapped)
    )

    self.navigationItem.rightBarButtonItem = button1

  }

  @objc func cartTapped() {
    print("hello")
  }
}
