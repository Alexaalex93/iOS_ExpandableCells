//
//  ExpandableTableViewCell.swift
//  ExpandableCells
//
//  Created by cice on 1/3/17.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

class ExpandableTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    var isExpanded: Bool = false {
        didSet { //Observer
            if !isExpanded {
                self.imageHeightConstraint.constant = 0.0
            } else {
                self.imageHeightConstraint.constant = 201.0
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
