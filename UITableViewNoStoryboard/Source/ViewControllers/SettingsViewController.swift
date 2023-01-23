//
//  SettingsViewController.swift
//  BlueLabs
//
//  Created by chloe korzh on 26/12/2022.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate {
    
    var preferenceManager = PreferenceManager.sharedInstance
    var cellSize: CGFloat = 0
    let tableView = UITableView(frame: .zero, style: .plain)
    var safeArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#191C17")
        safeArea = view.layoutMarginsGuide
        setupTableView()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(hexString: "#191C17")
        tableView.separatorColor = UIColor(hexString: "#191C17") //NORMALLY #38444D
        
        //cell with switch
        tableView.register(SwitchCell.self, forCellReuseIdentifier: "SwitchCell")
        //cell with accsessory type
        tableView.register(SimpleCell.self, forCellReuseIdentifier: "AccsessoryCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
}


extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccsessoryCell", for: indexPath) as? SimpleCell else { fatalError("") }
            cell.backgroundColor = UIColor(hexString: "#191C17")
            cell.textLabel?.textColor = .white
            cell.title = "Custom Switches Gallery"
            
            cell.accessoryType = .disclosureIndicator
            return cell

        } else if indexPath.row == 1 {
            
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchCell else { fatalError("couldn't load the cell") }
            cell.backgroundColor = UIColor(hexString: "#191C17")
            cellSize = cell.getCellSize()

            cell.title = "feature1"
            cell.subtitle = "feature1.description."
            
            let switchView = UISwitch(frame: .zero)
            //switchView.setOn(preferenceManager.feature1, animated: true)
            switchView.isOn = preferenceManager.feature1
            switchView.addTarget(self, action: #selector(feature1ValueChanged), for: UIControl.Event.valueChanged)
            cell.accessoryView = switchView
            
            return cell
            
        } else if indexPath.row == 2 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchCell else { fatalError("couldn't load the cell") }
            cell.backgroundColor = UIColor(hexString: "#191C17")
            cellSize = cell.getCellSize()

            cell.title = "feature2"
            cell.subtitle = "feature2.description."
            
            let switchView = UISwitch(frame: .zero)
            //switchView.setOn(preferenceManager.feature2, animated: true)
            switchView.isOn = preferenceManager.feature2
            switchView.addTarget(self, action: #selector(feature2ValueChanged), for: UIControl.Event.valueChanged)
            cell.accessoryView = switchView
            
            return cell
    
        }
        fatalError("could not dequeueReusableCell")
    }
    
    @objc private func feature1ValueChanged(_ sender: UISwitch) {
        preferenceManager.feature1 = sender.isOn
    }
    
    @objc private func feature2ValueChanged(_ sender: UISwitch) {
        preferenceManager.feature2 = sender.isOn
    }

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    if indexPath.row == 0 {
        
 
        let cusInfoCollVC = CustomSwitchesGalleryViewController()
        self.navigationController?.pushViewController(cusInfoCollVC, animated: true)
 
        
    }
    
    
}


}

