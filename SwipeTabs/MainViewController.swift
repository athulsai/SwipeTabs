//
//  ViewController.swift
//  SwipeTabs
//
//  Created by Athul Sai on 17/12/17.
//  Copyright © 2017 Athul.NET. All rights reserved.
//

import UIKit

enum Screen: String {
  case first
  case second
  case third
  case fourth
  case fifth
}

class MainViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var tabBarView: TabBarView!
  
  // MARK: - Variables
  var views = [UIView]()
  
  // MARK: - Life Cycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tabBarView.delegate = self
    loadScreens()
    collectionView.reloadData()
  }
  
  // MARK: - Private Methods
  private func loadScreens() {
    let firstVC = storyboard?.instantiateViewController(withIdentifier: Screen.first.rawValue.capitalized)
    let secondVC = storyboard?.instantiateViewController(withIdentifier: Screen.second.rawValue.capitalized)
    let thirdVC = storyboard?.instantiateViewController(withIdentifier: Screen.third.rawValue.capitalized)
    let fourthVC = storyboard?.instantiateViewController(withIdentifier: Screen.fourth.rawValue.capitalized)
    let fifthVC = storyboard?.instantiateViewController(withIdentifier: Screen.fifth.rawValue.capitalized)
    let viewControllers = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
    for vc in viewControllers {
      self.addChildViewController(vc!)
      vc!.didMove(toParentViewController: self)
      views.append(vc!.view)
    }
  }
}

// MARK: - UICollectionViewDelegateFlowLayout Methods
extension MainViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size = CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    return size
  }
}

// MARK: - UICollectionViewDataSource Methods
extension MainViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return views.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.reuseIdentifierIdentifier, for: indexPath) as? MainCollectionViewCell else {
      fatalError("Unexpected Cell!")
    }
    
    cell.configureCell(with: views[indexPath.item])
    return cell
  }
}

// MARK: - UICollectionViewDelegate Methods
extension MainViewController: UICollectionViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let scrollIndex = Int(scrollView.contentOffset.x / view.bounds.width)
    tabBarView.animateTab(to: scrollIndex)
  }
}

// MARK: - TabBarViewDelegate Methods
extension MainViewController: TabBarViewDelegate {
  func didSelectTab(index: Int) {
   collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
  }
}
