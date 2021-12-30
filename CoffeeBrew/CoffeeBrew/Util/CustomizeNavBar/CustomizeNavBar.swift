//
//  CustomizeNavBar.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import UIKit

/// This class is used to customize the navigation bar
class CustomizeNavBar {
    
    // MARK: - Utility methods
    
    /// This method is for left aligning the navigation view title 
    func setLeftAlignTitleView(controller: UIViewController, font: UIFont?, text: String, textColor: UIColor) {
        guard let font = font, let navFrame = controller.navigationController?.navigationBar.frame else {
            return
        }
        
        let parentView = UIView(frame: CGRect(x: 5, y: 0, width: navFrame.width*3, height: navFrame.height))
        controller.navigationItem.titleView = parentView
        
        let label = UILabel(frame: .init(x: parentView.frame.minX, y: parentView.frame.minY, width: parentView.frame.width, height: parentView.frame.height))
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = font
        label.textAlignment = .left
        label.textColor = textColor
        label.text = text
        
        parentView.addSubview(label)
    }

}
