//
//  StyleSelectionViewController.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import UIKit

/// This class is used to select the coffee style
class StyleSelectionViewController: UIViewController {

    // MARK: - UIViewController LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        CustomizeNavBar().setLeftAlignTitleView(controller: self, font: UIFont(name: "Avenir Next Bold", size: 16), text: "Brew with Lex", textColor: UIColor.black)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
