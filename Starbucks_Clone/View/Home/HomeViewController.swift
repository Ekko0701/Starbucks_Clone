//
//  HomeViewController.swift
//  Starbucks_Clone
//
//  Created by Corder Collie on 2022/06/30.
//

import UIKit
import SnapKit

class HomeViewController: CommonViewController {

    let headerView = HeaderView()
    var headerViewTopContraint: Constraint!
    
    var tableView = UITableView()
    let cellId = "cellId"
    let tiles = [
        "Star balance",
        "Bonus stars",
        "Try these",
        "Welcome back",
        "Uplifting"
    ]
    
    override func viewDidLoad() {
        print("Home - viewDidLoad()")
        style()
        layout()
        setupTableView()
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Home")
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
}

extension HomeViewController {
    func style() {
        
    }
    
    func layout() {
        //Add SubView
        view.addSubview(headerView)
        view.addSubview(tableView)
        
        //AutoLayout with SnapKit
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(320)
            
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = tiles[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
}


