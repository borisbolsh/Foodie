import UIKit

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
  }

  private func configurateCollectionViews() {
    categoryCollectionView.delegate = self
    categoryCollectionView.dataSource = self
    categoryCollectionView.register(UINib(nibName:  CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
  }

  @objc func cartTapped() {
    print("hello")
  }
}


extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    categories.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
      return UICollectionViewCell()
    }
    cell.setup(category: categories[indexPath.row])
    return cell
  }


}


extension HomeViewController: UICollectionViewDelegate {

}
