import UIKit
import ProgressHUD

final class ListDishesViewController: UIViewController {

  @IBOutlet weak var listDishesTableView: UITableView!

  var category: DishCategory!
  var dishes: [Dish] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    title = category.name

    ProgressHUD.show()
      NetworkService.shared.fetchCategoryDishes(categoryId: category.id ) { [weak self] (result) in
          switch result {
          case .success(let dishes):
              ProgressHUD.dismiss()
              self?.dishes = dishes
              self?.listDishesTableView.reloadData()
          case .failure(let error):
              ProgressHUD.showError(error.localizedDescription)
          }
      }

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
