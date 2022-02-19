import UIKit
import Kingfisher

class DishPortraitCollectionViewCell: UICollectionViewCell {
  static let identifier = String(describing: DishPortraitCollectionViewCell.self)

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dishImageView: UIImageView!
  @IBOutlet weak var caloriesLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!

  func setup(dish: Dish) {
    dishImageView.kf.setImage(with: dish.image?.asUrl)
    titleLabel.text = dish.name
    descriptionLabel.text = dish.description
    caloriesLabel.text = dish.formattedCalories
  }
}
