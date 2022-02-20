import UIKit

final class OrdersViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  var orders:[Order] = [
    Order(
      id: "id1",
      name: "John Doe",
      dish: Dish(
        id: "id2",
        name: "Hanna",
        description: "This is the best I have",
        image: "https://picsum.photos/100/200",
        calories: 19)
    ),
    Order(
      id: "id2",
      name: "Janen Kate",
      dish: Dish(
        id: "id2",
        name: "Lara",
        description: "This is the best I have",
        image: "https://picsum.photos/100/200",
        calories: 48)
    ),
    Order(
      id: "id3",
      name: "Nick Green",
      dish: Dish(
        id: "id3",
        name: "Luck",
        description: "This is the best I have",
        image: "https://picsum.photos/100/200",
        calories: 91)
    ),
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Orders"
    setupTableView()
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
