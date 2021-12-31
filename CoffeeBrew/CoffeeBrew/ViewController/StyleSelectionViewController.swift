//
//  StyleSelectionViewController.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 30/12/21.
//

import UIKit

/// This class is used to select the coffee style
class StyleSelectionViewController: UIViewController {

    // MARK: - IBOutlet declaration
    @IBOutlet weak var styleSelectionListTableView: UITableView!

    // MARK: - variable declaration
    private var viewModel: CoffeeBrewViewModel?

    // MARK: - UIViewController LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CoffeeBrewViewModel(sessionProvider: ApplicationHost.init().coffeeBrewSession, delegate: self)
        viewModel?.getCoffeeStyleList()
        navigationItem.hidesBackButton = true
        CustomizeNavBar().setLeftAlignTitleView(controller: self, font: UIFont(name: "Avenir Next Bold", size: 16), text: "Brew with Lex", textColor: UIColor.black)
        cellRegistration()
    }
    
    // MARK: - Private methods
    private func cellRegistration() {
        styleSelectionListTableView.dataSource = self
        styleSelectionListTableView.delegate = self
        styleSelectionListTableView.register(StyleSelectionListTableViewCell.nib, forCellReuseIdentifier: StyleSelectionListTableViewCell.reuseId)
        styleSelectionListTableView.allowsMultipleSelection = true
        styleSelectionListTableView.allowsMultipleSelectionDuringEditing = true
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSizeSelection" {
            guard let coffeeTypes = sender as? CoffeeTypes, let selectedStyles = viewModel?.styleSelectionList else {
                return
            }
            guard let destinationViewController = segue.destination as? SizesViewController else {
                return
            }
            destinationViewController.styleSelectionList = selectedStyles
            destinationViewController.coffeeTypes = coffeeTypes
        }
    }

}

// MARK: - UITableview DataSource methods
extension StyleSelectionViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.styleSelectionList?.types.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StyleSelectionListTableViewCell.reuseId) as? StyleSelectionListTableViewCell else {
            fatalError("Failed to load StyleSelectionListTableViewCell")
        }
        cell.selectionStyle = .none

        cell.setData(viewModel?.styleSelectionList?.types[indexPath.row], images: viewModel?.styleselectionImages ?? [:])
        return cell
    }

}

// MARK: - UITableview Delegate methods
extension StyleSelectionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = AnimationFactory.makeFadeAnimation(duration: 0.5, delayFactor: 0.05)
        let animator = TableViewAnimator.init(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedStyle = viewModel?.styleSelectionList?.types[indexPath.row] {
            performSegue(withIdentifier: "showSizeSelection", sender: selectedStyle)
        }
    }
}

// MARK: - CoffeeBrewViewModelDelegate Delegate methods
extension StyleSelectionViewController: CoffeeBrewViewModelDelegate {

    func didLoadCoffeeStyleList(coffeeStyleListData: CoffeeStyleItem) {
        debugPrint(coffeeStyleListData)
        DispatchQueue.main.async {
            self.styleSelectionListTableView.reloadData()
        }
    }
    
    func didFailLoadingCoffeeStyleList(_ error: Error) {
        debugPrint(error)
    }
    
}
