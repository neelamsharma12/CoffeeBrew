//
//  SizeViewController.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 31/12/21.
//

import UIKit

class SizesViewController: UIViewController {

    // MARK: - IBOutlet declaration
    @IBOutlet weak var sizeSelectionListTableView: UITableView!
    
    // MARK: - variable declaration
    var coffeeTypes: CoffeeTypes?
    var styleSelectionList: CoffeeStyleItem?
    var viewModel: SizeViewModel?
    
    // MARK: - UIViewController LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeNavBar().setLeftAlignTitleView(controller: self, font: UIFont(name: "Avenir Next Bold", size: 16), text: "Brew with Lex", textColor: UIColor.black)
        viewModel = SizeViewModel()
        cellRegistration()
        sizeSelectionListTableView.reloadData()
    }
    
    // MARK: - Private methods
    private func cellRegistration() {
        sizeSelectionListTableView.dataSource = self
        sizeSelectionListTableView.delegate = self
        sizeSelectionListTableView.register(StyleSelectionListTableViewCell.nib, forCellReuseIdentifier: StyleSelectionListTableViewCell.reuseId)
        sizeSelectionListTableView.allowsMultipleSelection = true
        sizeSelectionListTableView.allowsMultipleSelectionDuringEditing = true
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showExtrasSelection" {
            guard let coffeeTypes = sender as? CoffeeTypes, let selectedStyles = styleSelectionList else {
                return
            }
            guard let destinationViewController = segue.destination as? ExtrasViewController else {
                return
            }
            destinationViewController.styleSelectionList = selectedStyles
            destinationViewController.coffeeTypes = coffeeTypes
        }
    }
   
}

// MARK: - UITableview DataSource methods
extension SizesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getSizeList(coffeeTypes, coffeeStyles: styleSelectionList).count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StyleSelectionListTableViewCell.reuseId) as? StyleSelectionListTableViewCell else {
            fatalError("Failed to load SizeListTableViewCell")
        }
        cell.selectionStyle = .none
        
       let sizes = viewModel?.getSizeList(coffeeTypes, coffeeStyles: styleSelectionList)
        cell.setDataForSize(sizes?[indexPath.row], images: viewModel?.styleSelectionImages)
        return cell
    }

}

// MARK: - UITableview Delegate methods
extension SizesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = AnimationFactory.makeFadeAnimation(duration: 0.5, delayFactor: 0.05)
        let animator = TableViewAnimator.init(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedCoffeeType = coffeeTypes {
            performSegue(withIdentifier: "showExtrasSelection", sender: selectedCoffeeType)
        }
    }

}
