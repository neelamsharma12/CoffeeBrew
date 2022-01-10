//
//  CollapsibleTableViewCell.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 02/01/22.
//

import UIKit

class CollapsibleTableViewCell: UITableViewCell {

    // MARK: - Properties declaration
    let parentView = UIView()
    let nameLabel = UILabel()
    let selectButton = CustomButton()

    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let marginGuide = contentView.layoutMarginsGuide
        contentView.backgroundColor = UIColor(hex: 0xAED7A0)

        //Configure UIView
        contentView.addSubview(parentView)
        parentView.backgroundColor = UIColor(hex: 0x9BC88B)
        parentView.translatesAutoresizingMaskIntoConstraints = false
        parentView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 24).isActive = true
        parentView.heightAnchor.constraint(equalToConstant: 46).isActive = true
        parentView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -24).isActive = true
        parentView.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true

        // configure nameLabel
        parentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 16).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
        nameLabel.numberOfLines = 0
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont(name: "Avenir Next Bold", size: 14)

        // configure selectButton
        parentView.addSubview(selectButton)
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        selectButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        selectButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        selectButton.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
        selectButton.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -16).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
