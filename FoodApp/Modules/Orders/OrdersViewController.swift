import UIKit
import ProgressHUD

final class OrdersViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  var orders:[Order] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Orders"
    setupTableView()
    ProgressHUD.show()
  }

  override func viewDidAppear(_ animated: Bool) {
    NetworkService.shared.fetchOrders { [weak self] (result) in
      switch result {
      case .success(let orders):
        ProgressHUD.dismiss()

        self?.orders = orders
        self?.tableView.reloadData()
      case .failure(let error):
        ProgressHUD.showError(error.localizedDescription)
      }
    }
  }

  private func setupTableView(){
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(
      UINib(
        nibName: ListDishTableViewCell.identifier, bundle: nil),
      forCellReuseIdentifier: ListDishTableViewCell.identifier
    )
  }

}

extension OrdersViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    orders.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ListDishTableViewCell.identifier) as? ListDishTableViewCell else {
      return UITableViewCell()
    }
    cell.setup(order: orders[indexPath.row])
    return cell
  }
}

extension OrdersViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let controller = DishDetailViewController()
    controller.dish = orders[indexPath.row].dish
    navigationController?.pushViewController(controller, animated: true)
  }
}
