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
    func setData(_ selectedCoffeeType: CoffeeType?, images: [String: String]) {
        nameLabel?.text = selectedCoffeeType?.name
        if let img = images[selectedCoffeeType?.name ?? ""] {
            iconImageView?.isHidden = false
            iconImageView?.image = UIImage(named: img)
            leadingConstraint.constant = 19
        } else {
            iconImageView?.isHidden = true
            leadingConstraint.constant = -44
        }
    }
    
    func setDataForSize(_ sizeName: String?, images: [String: String]?) {
        nameLabel?.text = sizeName
        if let size = sizeName, let img = images?[size] {
            iconImageView?.image = UIImage(named: img)
        }
    }
    
    func setDataForExtras(_ extraName: [String: [String]]?, images: [String: String]?) {
        nameLabel?.text = extraName?.keys.first
        if let extra = extraName?.keys.first, let img = images?[extra] {
            iconImageView?.image = UIImage(named: img)
        }
    }

    // MARK: - UITableViewCell selection methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
