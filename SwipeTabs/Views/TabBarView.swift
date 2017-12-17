//
//  TabBarView.swift
//  SwipeTabs
//
//  Created by Athul Sai on 17/12/17.
//  Copyright © 2017 Athul.NET. All rights reserved.
//

import UIKit

protocol TabBarViewDelegate: class {
  func didSelectTab(index: Int)
}

class TabBarView: UIView {
  
  // MARK: - Constants
  let titles = ["SPORTS", "TECHNOLOGIES", "DESIGN", "POLITICS", "MOVIES"]
  let tabFontSize = CGFloat(20.0)
  let tabHeight = CGFloat(44.0)
  let minTabSpace = CGFloat(10.0)
  
  // MARK: - IBOutlets
  @IBOutlet weak var collectionView: UICollectionView!
  
  // MARK: - Variables
  var selectedIndex = 0
  weak var delegate: TabBarViewDelegate?
  
  // MARK: - Life cycle methods
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  // MARK: - Public Methods
  func animateTab(to index: Int) {
    let indexPath = IndexPath(item: index, section: 0)
    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    selectedIndex = index
    layoutIfNeeded()
    collectionView.reloadData()
  }
}

// MARK: - UICollectionViewDelegateFlowLayout Methods
extension TabBarView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let attributes: [NSAttributedStringKey : Any] = [.font: UIFont.systemFont(ofSize: tabFontSize, weight: .heavy)]
    let width = (titles[indexPath.row] as NSString).size(withAttributes: attributes).width + minTabSpace
    return CGSize(width: width, height: tabHeight)
  }
}

// MARK: - UICollectionViewDataSource Methods
extension TabBarView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return titles.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabBarCollectionViewCell.reuseIdentifierIdentifier, for: indexPath) as? TabBarCollectionViewCell else {
      fatalError("Unexpected Cell!")
    }
    
    cell.configureCell(with: titles[indexPath.row], selected: selectedIndex == indexPath.item)
    return cell
  }
}

// MARK: - UICollectionViewDelegate Methods
extension TabBarView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if selectedIndex != indexPath.item {
      selectedIndex = indexPath.item
      delegate?.didSelectTab(index: selectedIndex)
    }
  }
}


