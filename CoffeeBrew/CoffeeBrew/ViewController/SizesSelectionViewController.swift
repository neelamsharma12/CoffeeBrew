//
//  SizeViewController.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 31/12/21.
//

import UIKit

/// This class is used to select the size of the coffee
final class SizesSelectionViewController: UIViewController {
    
    // MARK: - IBOutlet declaration
    @IBOutlet weak var sizeSelectionListTableView: UITableView!
    
    // MARK: - variable declaration
    var selectedCoffeeType: CoffeeType?
    var styleSelectionList: CoffeeStyleItem?
    var viewModel: SizeSelectionViewModel?
    
    // MARK: - UIViewController LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeNavBar().setLeftAlignTitleView(controller: self, font: UIFont(name: "Avenir Next Bold", size: 16), text: "Brew with Lex", textColor: UIColor.black)
        viewModel = SizeSelectionViewModel()
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
    
}

// MARK: - UITableview DataSource methods
extension SizesSelectionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getSizeList(selectedCoffeeType, coffeeStyles: styleSelectionList).count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StyleSelectionListTableViewCell.reuseId) as? StyleSelectionListTableViewCell else {
            fatalError("Failed to load SizeListTableViewCell")
        }
        cell.selectionStyle = .none
        
        let sizes = viewModel?.getSizeList(selectedCoffeeType, coffeeStyles: styleSelectionList)
        cell.setDataForSize(sizes?[indexPath.row], images: viewModel?.sizeSelectionImages)
        return cell
    }
    
}

// MARK: - UITableview Delegate methods
extension SizesSelectionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = AnimationFactory.makeFadeAnimation(duration: 0.5, delayFactor: 0.05)
        let animator = TableViewAnimator.init(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedCoffeeSize = selectedCoffeeType?.sizes[indexPath.row] {
            let extraCollapsibleTVC = ExtrasSelectionCollapsibleTableViewController()
            extraCollapsibleTVC.styleSelectionList = styleSelectionList
            extraCollapsibleTVC.selectedCoffeeType = selectedCoffeeType
            extraCollapsibleTVC.selectedCoffeeSize = selectedCoffeeSize
            self.navigationController?.pushViewController(extraCollapsibleTVC, animated: true)
        }
    }
    
}
