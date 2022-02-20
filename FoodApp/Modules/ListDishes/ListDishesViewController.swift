import UIKit

final class ListDishesViewController: UIViewController {

  @IBOutlet weak var listDishesTableView: UITableView!

  var category: DishCategory!
  var dishes: [Dish] = [
    Dish(id: "id1", name: "John", description: "This is the best I have This is the best I have This is the best I have This is the best I have This is the best I have This is the best", image: "https://picsum.photos/100/200", calories: 233),
    Dish(id: "id2", name: "Hanna", description: "This is the best I have", image: "https://picsum.photos/100/200", calories: 133),
    Dish(id: "id3", name: "Kate", description: "This is the best I have", image: "https://picsum.photos/100/200", calories: 333)

  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    title = category.name
    setupTableView()
  }

  private func setupTableView(){
    listDishesTableView.dataSource = self
    listDishesTableView.delegate = self
    listDishesTableView.register(
      UINib(
        nibName: ListDishTableViewCell.identifier, bundle: nil),
      forCellReuseIdentifier: ListDishTableViewCell.identifier
    )
  }
}

extension ListDishesViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dishes.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ListDishTableViewCell.identifier) as? ListDishTableViewCell else {
      return UITableViewCell()
    }
    cell.setup(dish: dishes[indexPath.row])
    return cell
  }
}

extension ListDishesViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let controller = DishDetailViewController()
    controller.dish = dishes[indexPath.row]
    navigationController?.pushViewController(controller, animated: true)
  }
}
