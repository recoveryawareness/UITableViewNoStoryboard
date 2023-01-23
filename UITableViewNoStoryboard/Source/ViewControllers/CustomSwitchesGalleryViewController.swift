//
//  CustomSwitchesGalleryViewController.swift
//  UITableViewNoStoryboard
//
//  Created by chloe korzh on 22/01/2023.
//  Copyright © 2023 JournalDev.com. All rights reserved.
//

import Foundation
import UIKit

class CustomSwitchesGalleryViewController: UIViewController, UITableViewDelegate {
    
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
        tableView.separatorColor = UIColor(hexString: "#191C17")
        
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


extension CustomSwitchesGalleryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
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
            
        } else if indexPath.row == 1 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchCell else { fatalError("couldn't load the cell") }
            cell.backgroundColor = UIColor(hexString: "#191C17")
            cellSize = cell.getCellSize()
            
            cell.title = "feature2"
            cell.subtitle = "feature2.description."
            
            let animatedStyleA = YapAnimatedSwitch()
            animatedStyleA.borderWidth = 0.7
            animatedStyleA.offBorderColor = #colorLiteral(red: 0.5531766415, green: 0.5738264918, blue: 0.5252009034, alpha: 1)
            animatedStyleA.offTintColor = #colorLiteral(red: 0.2621000409, green: 0.2876122594, blue: 0.243190378, alpha: 1)
            animatedStyleA.onThumbTintColor = #colorLiteral(red: 0.04343441129, green: 0.2247487009, blue: 0, alpha: 1)
            animatedStyleA.onTintColor = #colorLiteral(red: 0.611586988, green: 0.8452003002, blue: 0.4905993342, alpha: 1)
            animatedStyleA.offThumbTintColor = #colorLiteral(red: 0.5531766415, green: 0.5738264918, blue: 0.5252009034, alpha: 1)
            animatedStyleA.isOn = preferenceManager.feature2
            animatedStyleA.addTarget(self, action: #selector(feature2ValueChanged), for: UIControl.Event.valueChanged)
            
            
            cell.accessoryView = animatedStyleA
            
            
            
            
            return cell
            
        }
        fatalError("could not dequeueReusableCell")
    }
    
    @objc private func feature1ValueChanged(_ sender: UISwitch) {
        preferenceManager.feature1 = sender.isOn
    }
    
    @objc private func feature2ValueChanged(_ sender: YapAnimatedSwitch) {
        preferenceManager.feature2 = sender.isOn
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            
            
        }
        
        
    }
    
    
}

