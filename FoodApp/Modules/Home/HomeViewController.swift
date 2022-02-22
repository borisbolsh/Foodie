import UIKit
import ProgressHUD

final class HomeViewController: UIViewController {
  @IBOutlet weak var categoryCollectionView: UICollectionView!
  @IBOutlet weak var popularCollectionView: UICollectionView!
  @IBOutlet weak var specialsCollectionView: UICollectionView!

  var categories: [DishCategory] = [
    DishCategory(id: "id1", name: "Africa dish 1", image: "https://picsum.photos/100/200"),
    DishCategory(id: "id1", name: "Africa dish 2", image: "https://picsum.photos/100/200"),
    DishCategory(id: "id1", name: "Africa dish 3", image: "https://picsum.photos/100/200"),
    DishCategory(id: "id1", name: "Africa dish 4", image: "https://picsum.photos/100/200"),
    DishCategory(id: "id1", name: "Africa dish 5", image: "https://picsum.photos/100/200")
  ]
  var populars: [Dish] = [
    Dish(id: "id1", name: "John", description: "This is the best I have This is the best I have This is the best I have This is the best I have This is the best I have This is the best", image: "https://picsum.photos/100/200", calories: 233),
    Dish(id: "id2", name: "Hanna", description: "This is the best I have", image: "https://picsum.photos/100/200", calories: 133),
    Dish(id: "id3", name: "Kate", description: "This is the best I have", image: "https://picsum.photos/100/200", calories: 333)

  ]
  var specials: [Dish] = [
    Dish(id: "id1", name: "Beans beans 1", description: "This is the best I have", image: "https://picsum.photos/100/200", calories: 10),
    Dish(id: "id2", name: "Beans beans 2", description: "This is the best I have", image: "https://picsum.photos/100/200", calories: 20),
    Dish(id: "id3", name: "Beans beans 3", description: "This is the best I have", image: "https://picsum.photos/100/200", calories: 30)
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    self.title = "Foodie"

    let rightBarButtonNav = UIBarButtonItem(
      image: UIImage(named: "cart"),
      style: .plain,
      target: self,
      action: #selector(cartTapped)
    )

    self.navigationItem.rightBarButtonItem = rightBarButtonNav
    
    configurateCollectionViews()

    ProgressHUD.show()
    NetworkService.shared.fetchAllCategories { [weak self] (result) in
      switch result {
      case .success(let allDishes):
        ProgressHUD.dismiss()
        self?.categories = allDishes.categories ?? []
        self?.populars = allDishes.populars ?? []
        self?.specials = allDishes.specials ?? []

        self?.categoryCollectionView.reloadData()
        self?.popularCollectionView.reloadData()
        self?.specialsCollectionView.reloadData()
      case .failure(let error):
        ProgressHUD.showError(error.localizedDescription)
      }
    }
  }

  private func configurateCollectionViews() {
    categoryCollectionView.delegate = self
    categoryCollectionView.dataSource = self
    categoryCollectionView.register(UINib(nibName:  CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    popularCollectionView.delegate = self
    popularCollectionView.dataSource = self
    popularCollectionView.register(UINib(nibName:  DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
    specialsCollectionView.delegate = self
    specialsCollectionView.dataSource = self
    specialsCollectionView.register(UINib(nibName:  DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
  }

  @objc func cartTapped() {
    let controller = OrdersViewController()
    navigationController?.pushViewController(controller, animated: true)
  }
}


extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch collectionView {
    case categoryCollectionView:
      return categories.count
    case popularCollectionView:
      return populars.count
    case specialsCollectionView:
      return specials.count
    default:
      return 0
    }

  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    switch collectionView {
    case categoryCollectionView:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
        return UICollectionViewCell()
      }
      cell.setup(category: categories[indexPath.row])
      return cell
    case popularCollectionView:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as? DishPortraitCollectionViewCell else {
        return UICollectionViewCell()
      }
      cell.setup(dish: populars[indexPath.row])
      return cell
    case specialsCollectionView:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as? DishLandscapeCollectionViewCell else {
        return UICollectionViewCell()
      }
      cell.setup(dish: specials[indexPath.row])
      return cell

    default:
      return UICollectionViewCell()
    }

  }


}


extension HomeViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if collectionView == categoryCollectionView {
      let controller = ListDishesViewController()
      controller.category = categories[indexPath.row]
      navigationController?.pushViewController(controller, animated: true)
    } else  {
      let controller = DishDetailViewController()
      controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
      navigationController?.pushViewController(controller, animated: true)
    }
  }
}
