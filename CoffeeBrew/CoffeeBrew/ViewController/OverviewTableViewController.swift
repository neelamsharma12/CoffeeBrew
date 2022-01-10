//
//  OverviewTableViewController.swift
//  CoffeeBrew
//
//  Created by Neelam Sharma on 04/01/22.
//

import UIKit

class OverviewTableViewController: UITableViewController {

    // MARK: - variable declaration
    var selectedCoffeeType: CoffeeType?
    var selectedCoffeeSize: String?
    var styleSelectionList: CoffeeStyleItem?
    var selectedExtrasIndexPath = [IndexPath: Bool]()
    var sectionsData = [Section]()
    var extrasList = [[String: [String]]]()
    var selectedExtrasList = [[String: [String]]]()
    var viewModel: OverviewViewModel?
    var totalSections = 0
    
    // MARK: - UIViewController LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 40, left: 16, bottom: 0, right: 0)
        tableView.estimatedRowHeight = 90.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        if #available(iOS 15.0, *){
            tableView.sectionHeaderTopPadding = 0.0
        }
        CustomizeNavBar().setLeftAlignTitleView(controller: self, font: UIFont(name: "Avenir Next Bold", size: 16), text: "Brew with Lex", textColor: UIColor.black)
        viewModel = OverviewViewModel()
        getSelectedSectionsData()
        totalSections = self.selectedExtrasList.count + 2
        addBrewYourCoffeeButtonView()
        addOverViewSubtitle()
    }

    private func getSelectedSectionsData() {
        guard let selectedExtrasList = viewModel?.getSelectedExtrasList(extrasList, selectedExtras: selectedExtrasIndexPath) else {
            return
        }
        self.selectedExtrasList = selectedExtrasList
        sectionsData = viewModel?.getSelectedSections(self.selectedExtrasList) ?? [Section]()
    }
    
    private func addBrewYourCoffeeButtonView() {
        let brewCoffee = UIButton()
        brewCoffee.titleLabel?.textColor = UIColor.white
        brewCoffee.titleLabel?.textAlignment = .left
        brewCoffee.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 18)
        brewCoffee.backgroundColor = UIColor(hex: 0xAED7A0)
        brewCoffee.setTitle("Brew your coffee", for: .normal)
        tableView.addSubview(brewCoffee)

        // set position
        brewCoffee.translatesAutoresizingMaskIntoConstraints = false
        brewCoffee.leftAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        brewCoffee.rightAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.rightAnchor, constant: -17).isActive = true
        brewCoffee.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.bottomAnchor, constant: -56).isActive = true
        brewCoffee.widthAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.widthAnchor).isActive = true
        brewCoffee.heightAnchor.constraint(equalToConstant: 94).isActive = true
    }
    
    private func addOverViewSubtitle() {
        let overviewLabel = UILabel()
        overviewLabel.textColor = UIColor.black
        overviewLabel.textAlignment = .left
        overviewLabel.font = UIFont(name: "Avenir Next", size: 24)
        overviewLabel.text = "Overview"
        tableView.addSubview(overviewLabel)

        // set position
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.leftAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        overviewLabel.rightAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.rightAnchor, constant: -17).isActive = true
        overviewLabel.topAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        overviewLabel.widthAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.widthAnchor).isActive = true
        overviewLabel.heightAnchor.constraint(equalToConstant: 33).isActive = true
    }
    
    private func addBrewYourCoffeeButton() {
        let brewYourCoffeeBtn = UIButton.init(type: .system)
        brewYourCoffeeBtn.setTitle("Brew your coffee", for: .normal)
        
        brewYourCoffeeBtn.frame.size = CGSize(width: 343, height: 94)
        brewYourCoffeeBtn.backgroundColor = UIColor(hex: 0xAED7A0)
        brewYourCoffeeBtn.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        brewYourCoffeeBtn.titleLabel?.textColor = UIColor.white
        self.view.addSubview(brewYourCoffeeBtn)
        
        //set constrains
        brewYourCoffeeBtn.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            brewYourCoffeeBtn.trailingAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
            brewYourCoffeeBtn.leadingAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
            brewYourCoffeeBtn.trailingAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
            brewYourCoffeeBtn.heightAnchor.constraint(equalToConstant: 94).isActive = true
            brewYourCoffeeBtn.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.bottomAnchor, constant: -56).isActive = true
        } else {
            brewYourCoffeeBtn.rightAnchor.constraint(equalTo: tableView.layoutMarginsGuide.rightAnchor, constant: 0).isActive = true
            brewYourCoffeeBtn.bottomAnchor.constraint(equalTo: tableView.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return totalSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 {
            return 0
        } else {
            return sectionsData[section-self.selectedExtrasList.count].collapsed ? 0 : sectionsData[section-self.selectedExtrasList.count].items.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CollapsibleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CollapsibleTableViewCell ??
            CollapsibleTableViewCell(style: .default, reuseIdentifier: "cell")
        
        if indexPath.section == 2 ||  indexPath.section == 3 {
            let item: Item = sectionsData[indexPath.section-self.selectedExtrasList.count].items[indexPath.row]
            cell.selectButton.setImage(UIImage(named: "selected"), for: .normal)
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
        if section == -1 {
            header.titleLabel.text = "Overview"
            header.titleLabel.textColor = UIColor.black
            header.titleLabel.font = UIFont(name: "Avenir Next", size: 24)
            header.imageView.isHidden = true
            header.separator.isHidden = true
            header.contentView.backgroundColor = UIColor.white
            header.titleLabel.leadingAnchor.constraint(equalTo: header.contentView.layoutMarginsGuide.leadingAnchor, constant: -10).isActive = true
        } else if section == 0 {
            header.titleLabel.text = selectedCoffeeType?.name
            if let imgName = viewModel?.overviewSelectionImages[selectedCoffeeType?.name ?? ""] {
                header.imageView.isHidden = false
                header.imageView.image = UIImage(named: imgName)
            }
            header.separator.isHidden = false
        } else if section == 1 {
            header.titleLabel.text = selectedCoffeeSize
            if let imgName = viewModel?.overviewSelectionImages[selectedCoffeeSize ?? ""] {
                header.imageView.isHidden = false
                header.imageView.image = UIImage(named: imgName)
            }
            header.separator.isHidden = false
        } else {
            header.titleLabel.text = sectionsData[section-self.selectedExtrasList.count].name
            if let imgName = viewModel?.overviewSelectionImages[sectionsData[section-self.selectedExtrasList.count].name ] {
                header.imageView.isHidden = false
                header.imageView.image = UIImage(named: imgName)
            }
            header.separator.isHidden = false
            header.delegate = self
            if sectionsData[section-self.selectedExtrasList.count].collapsed {
                header.separator.isHidden = false
            }
        }
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0xAED7A0)
        return view
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == -1 {
            return 1
        }
        return 90.0
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 {
            return 0
        } else {
            if sectionsData[section-self.selectedExtrasList.count].collapsed {
                return 0
            } else {
                return 20.0
            }
        }
    }

}

// MARK: - Section Header Delegate
//
extension OverviewTableViewController: CollapsibleTableViewHeaderDelegate {

    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let currentSection = section == 0 ? 0 : section - self.selectedExtrasList.count
        let collapsed = !sectionsData[currentSection].collapsed
        
        // Toggle collapse
        sectionsData[currentSection].collapsed = collapsed
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
}

