import UIKit

final class OnboardingViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var nextButton: UIButton!
  @IBOutlet weak var pageControl: UIPageControl!

  var slides: [OnboardingSlide] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    configurateCollectionView()

    slides = [
      OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
      OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
      OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
    ]
  }

  @IBAction func nextBtnTapped(_ sender: UIButton) {
    
  }

  func setupUI(){

  }

  func configurateCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
  }
}


extension OnboardingViewController: UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    slides.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else {
      return UICollectionViewCell()
    }
    cell.setup(slides[indexPath.row])
    return cell
  }


}

extension OnboardingViewController: UICollectionViewDelegate {

}
