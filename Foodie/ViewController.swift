//
//  ViewController.swift
//  Foodie
//
//  Created by Boris Bolshakov on 3.12.21.
//

import UIKit

class ViewController: UIViewController {

    enum MealType {
        case breakfast
        case lunch
        case dinner
        case snack
        case teatime
        
        case none
    }
    
    var items = ["one", "one", "one", "one", "one", "one", "one", "one", "one", "one", "one", "one", "one", "one", "one", "one", "one", "one", "one", "one", "one", "one", "one"]
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView()
        cv.register(
              TestCollectionViewCell.self,
              forCellWithReuseIdentifier: TestCollectionViewCell.identifier)
        return cv
    }()
  
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate(
            [collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)]
           )
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = UICollectionViewCell()
    
        return cell
    }


    
    
}
