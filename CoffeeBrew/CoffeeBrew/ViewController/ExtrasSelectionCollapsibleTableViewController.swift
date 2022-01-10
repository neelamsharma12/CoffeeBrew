//
//  ExtrasCollapsibleTableViewController.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 02/01/22.
//

import UIKit

/// This class is used to select the Extras for the coffee
final class ExtrasSelectionCollapsibleTableViewController: UITableViewController {

    // MARK: - variable declaration
    var selectedCoffeeType: CoffeeType?
    var selectedCoffeeSize: String?
    var styleSelectionList: CoffeeStyleItem?
    var viewModel: ExtrasSelectionViewModel?
    var extrasList = [[String: [String]]]()
    var sectionsData = [Section]()
    var selectedExtrasIndexPath = [IndexPath: Bool]()
    
    // MARK: - UIViewController LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: -10, left: 16, bottom: 0, right: 0)
        tableView.estimatedRowHeight = 94.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        addRightBarButton()
        CustomizeNavBar().setLeftAlignTitleView(controller: self, font: UIFont(name: "Avenir Next Bold", size: 16), text: "Brew with Lex", textColor: UIColor.black)
        viewModel = ExtrasSelectionViewModel()
        getSectionsData()
    }

    // MARK: - Utitlity methods
    
    private func addRightBarButton() {
        let rightBarButtonItem = UIBarButtonItem(title: "Overview", style: .plain, target: self, action: #selector(addTapped))
        rightBarButtonItem.tintColor = UIColor.black
        rightBarButtonItem.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont(name: "Avenir Next Bold", size: 14)!], for: UIControl.State.normal)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func getSectionsData() {
        guard let extrasList = viewModel?.getExtrasList(selectedCoffeeType, coffeeStyles: styleSelectionList) else {
            return
        }
        self.extrasList = extrasList
        sectionsData = viewModel?.getSections(self.extrasList) ?? [Section]()
    }

    @objc func addTapped(_ sender: UIButton) {
        let overviewTVC = OverviewTableViewController()
        overviewTVC.selectedCoffeeType = selectedCoffeeType
        overviewTVC.selectedCoffeeSize = selectedCoffeeSize
        overviewTVC.extrasList = extrasList
        overviewTVC.selectedExtrasIndexPath = selectedExtrasIndexPath
        self.navigationController?.pushViewController(overviewTVC, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsData.count + 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if section == 0 {
            return 0
        } else {
            return sectionsData[section-1].collapsed ? 0 : sectionsData[section-1].items.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CollapsibleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CollapsibleTableViewCell ??
            CollapsibleTableViewCell(style: .default, reuseIdentifier: "cell")
        
        if indexPath.section != 0 {
            let item: Item = sectionsData[indexPath.section-1].items[indexPath.row]
            
            if let isSelected = selectedExtrasIndexPath[indexPath] {
                if isSelected {
                    cell.selectButton.setImage(UIImage(named: "selected"), for: .selected)
                } else {
                    cell.selectButton.setImage(UIImage(named: "unselected"), for: .normal)
                }
            } else {
                cell.selectButton.setImage(UIImage(named: "unselected"), for: .normal)
            }
            cell.selectButton.indexPath = indexPath
            cell.nameLabel.text = item.name
        }
        return cell
       
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        header.section = section
        if section == 0 {
            header.titleLabel.text = "Select your extra’s"
            header.titleLabel.textColor = UIColor.black
            header.titleLabel.font = UIFont(name: "Avenir Next", size: 24)
            header.imageView.isHidden = true
            header.separator.isHidden = true
            header.contentView.backgroundColor = UIColor.white
            header.titleLabel.leadingAnchor.constraint(equalTo: header.contentView.layoutMarginsGuide.leadingAnchor, constant: -10).isActive = true
        } else {
            header.titleLabel.text = sectionsData[section-1].name
            if let imgName = viewModel?.extrasSelectionImages[sectionsData[section-1].name ] {
                header.imageView.isHidden = false
                header.imageView.image = UIImage(named: imgName)
            }
            header.separator.isHidden = false
            header.delegate = self
            if sectionsData[section-1].collapsed {
                header.separator.isHidden = true
            }
        }
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentSelectedCell = tableView.cellForRow(at: indexPath) as? CollapsibleTableViewCell
        if let isSelected = selectedExtrasIndexPath[indexPath] {
            if isSelected {
                currentSelectedCell?.selectButton.setImage(UIImage(named: "unselected"), for: UIControl.State())
                selectedExtrasIndexPath[indexPath] = false
            } else {
                currentSelectedCell?.selectButton.setImage(UIImage(named: "selected"), for: UIControl.State())
                selectedExtrasIndexPath[indexPath] = true
            }
        } else {
            currentSelectedCell?.selectButton.setImage(UIImage(named: "selected"), for: UIControl.State())
            selectedExtrasIndexPath[indexPath] = true
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0xAED7A0)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 1
        }
        return 94.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        if sectionsData[section-1].collapsed {
            return 0
        } else {
            return 20.0
        }
    }

}

// MARK: - Section Header Delegate
//
extension ExtrasSelectionCollapsibleTableViewController: CollapsibleTableViewHeaderDelegate {

    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let currentSection = section == 0 ? 0 : section - 1
        let collapsed = !sectionsData[currentSection].collapsed

        // Toggle collapse
        sectionsData[currentSection].collapsed = collapsed
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }

}
