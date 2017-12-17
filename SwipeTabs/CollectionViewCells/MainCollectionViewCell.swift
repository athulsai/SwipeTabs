//
//  MainCollectionViewCell.swift
//  SwipeTabs
//
//  Created by Athul Sai on 17/12/17.
//  Copyright © 2017 Athul.NET. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Constants
  static let reuseIdentifierIdentifier = "Cell"
  
  // MARK: - IBOutlets
  @IBOutlet weak var containerView: UIView!
  
  // MARK: - Public Methods
  func configureCell (with view: UIView){
    view.frame = containerView.frame
    containerView.addSubview(view)
  }
}
