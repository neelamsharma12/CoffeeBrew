//
//  StyleSelectionListTableViewCell.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 31/12/21.
//

import UIKit

class StyleSelectionListTableViewCell: UITableViewCell, ReusableCell {

    // MARK: - IBOutlet declaration
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var iconImageView: UIImageView?
    @IBOutlet  var leadingConstraint: NSLayoutConstraint!
    
    // MARK: - UITableViewCell methods
    func setData(_ styleSelectionListItem: CoffeeTypes?, images: [String: String]) {
        nameLabel?.text = styleSelectionListItem?.name
        if let img = images[styleSelectionListItem?.name ?? ""] {
            iconImageView?.isHidden = false
            iconImageView?.image = UIImage(named: img)
            leadingConstraint.constant = 19
        } else {
            iconImageView?.isHidden = true
            leadingConstraint.constant = -44
        }
    }

    // MARK: - UITableViewCell selection methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
