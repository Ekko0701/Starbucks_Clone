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
    
    let headerMaxHeight: CGFloat = 320
    let headerMinHeight: CGFloat = 110
    
    var headerViewTopContraint: Constraint! // Top Constraint
    var headerViewHeightConstant: CGFloat = 320
    
    var tableView = UITableView()
    let cellId = "cellId"
    let testArray = [
        "아메리카노",
        "카페라떼",
        "돌체라떼",
        "아이스크림",
        "샌드위치",
        "아메리카노",
        "카페라떼",
        "돌체라떼",
        "아이스크림",
        "샌드위치",
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
            headerViewTopContraint = make.top.equalToSuperview().constraint
            make.height.equalTo(headerViewHeightConstant)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
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
    
    //Animation
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        let remainY: CGFloat = headerViewHeightConstant - y
        
        if remainY > headerMaxHeight { //내리는 경우
            headerViewTopContraint.update(offset: 0) // 상단에 고정
        } else if remainY < headerMinHeight { // headerview 일정 부분 고정 // headerView 다 올라간 후
            headerViewTopContraint.update(offset: -(headerMaxHeight - headerMinHeight))
        } else { // headerView 이동
            headerViewHeightConstant = remainY
            headerViewTopContraint.update(offset: -(headerMaxHeight - remainY))
            
            scrollView.contentOffset.y = 0
        }
        
        
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = testArray[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
}


