//
//  TabBarCollectionViewCell.swift
//  SwipeTabs
//
//  Created by Athul Sai on 17/12/17.
//  Copyright © 2017 Athul.NET. All rights reserved.
//

import UIKit

class TabBarCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Constants
  static let reuseIdentifierIdentifier = "Cell"
  
  // MARK: - IBOutlets
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var indicatorView: UIView!
  
  // MARK: - Public Methods
  func configureCell (with title: String, selected: Bool){
    titleLabel.text = title
    indicatorView.isHidden = !selected
  }
}
