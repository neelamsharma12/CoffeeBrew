//
//  CollapsibleTableViewHeader.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 02/01/22.
//

import UIKit

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int)
}

class CollapsibleTableViewHeader: UITableViewHeaderFooterView {
    
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    let titleLabel = UILabel()
    let imageView = UIImageView()
    let separator = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        // Content View
        contentView.backgroundColor = UIColor(hex: 0xAED7A0)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        // ImageView
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 46).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        imageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 16).isActive = true
        imageView.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
    
        // Title label
        contentView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
        titleLabel.font = UIFont(name: "Avenir Next Bold", size: 14)
        
        // Separator
        contentView.addSubview(separator)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -20).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 20).isActive = true
        separator.backgroundColor = UIColor.white
        separator.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: 0).isActive = true
    
        // Call tapHeader when tapping on this header
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleTableViewHeader.tapHeader(_:))))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    // Trigger toggle section when tapping on the header
    //
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CollapsibleTableViewHeader else {
            return
        }
        
        delegate?.toggleSection(self, section: cell.section)
    }
    
}

