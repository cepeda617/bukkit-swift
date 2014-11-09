//
//  ListItemCell.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 11/3/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import UIKit

class ListItemCell: UITableViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
