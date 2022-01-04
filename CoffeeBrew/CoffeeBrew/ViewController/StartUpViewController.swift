//
//  ViewController.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import UIKit

/// This class is used to set up the start up view 
final class StartUpViewController: UIViewController {

    // MARK: - IBOutlet declaration
    @IBOutlet weak var linkLabel: UILabel!
    
    // MARK: - UIViewController LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        CustomizeNavBar().setLeftAlignTitleView(controller: self, font: UIFont(name: "Avenir Next Bold", size: 16), text: "Dark Roasted Beans", textColor: UIColor.black)
        setupLabelTap()
    }
    
    // MARK: - Private methods
    private func setupLabelTap() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        linkLabel.isUserInteractionEnabled = true
        linkLabel.addGestureRecognizer(labelTap)
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "showSelectionStyles", sender: nil)
    }

}
