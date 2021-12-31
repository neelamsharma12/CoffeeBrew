//
//  ExtrasViewController.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 31/12/21.
//

import UIKit

class ExtrasViewController: UIViewController {

    // MARK: - IBOutlet declaration
    @IBOutlet weak var extrasSelectionListTableView: UITableView!
    
    // MARK: - variable declaration
    var coffeeTypes: CoffeeTypes?
    var styleSelectionList: CoffeeStyleItem?
    var viewModel: ExtrasViewModel?
    
    // MARK: - UIViewController LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeNavBar().setLeftAlignTitleView(controller: self, font: UIFont(name: "Avenir Next Bold", size: 16), text: "Brew with Lex", textColor: UIColor.black)
        viewModel = ExtrasViewModel()
        cellRegistration()
    }

    // MARK: - Private methods
    private func cellRegistration() {
        extrasSelectionListTableView.dataSource = self
        extrasSelectionListTableView.delegate = self
        extrasSelectionListTableView.register(StyleSelectionListTableViewCell.nib, forCellReuseIdentifier: StyleSelectionListTableViewCell.reuseId)
        extrasSelectionListTableView.allowsMultipleSelection = true
        extrasSelectionListTableView.allowsMultipleSelectionDuringEditing = true
    }

}

// MARK: - UITableview DataSource methods
extension ExtrasViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getExtrasList(coffeeTypes, coffeeStyles: styleSelectionList).count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StyleSelectionListTableViewCell.reuseId) as? StyleSelectionListTableViewCell else {
            fatalError("Failed to load ExtrasSelectionListTableViewCell")
        }
        cell.selectionStyle = .none
        
       let extras = viewModel?.getExtrasList(coffeeTypes, coffeeStyles: styleSelectionList)
        cell.setDataForSize(extras?[indexPath.row], images: viewModel?.styleSelectionImages)
        return cell
    }

}

// MARK: - UITableview Delegate methods
extension ExtrasViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = AnimationFactory.makeFadeAnimation(duration: 0.5, delayFactor: 0.05)
        let animator = TableViewAnimator.init(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }

}
