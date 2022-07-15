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
    var preY: CGFloat = 0
    
    var headerViewTopContraint: Constraint! // Top Constraint
    var headerViewHeightConstant: CGFloat = 320
    
    var tableView = UITableView()
    
    var deliversButton = UIButton()
    var deliversButtonWidth: Constraint!
    
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
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(FrequencyView.self, forCellReuseIdentifier: FrequencyView.cellId)
        //tableView.tableFooterView = UIView()
        //self.tableView.rowHeight = UITableView.automaticDimension //cell의 높이를 cell안의 요소에 맞게 동적으로 설정되도록 함.
        //self.tableView.estimatedRowHeight = 100 // 예상되는 rowheight 값
        //tableView.estimatedRowHeight = UITableView.automaticDimension
        deliversButton.layer.cornerRadius = 0.5 * 60
        
    }
}

extension HomeViewController {
    func style() {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let bikeImage = UIImage(systemName: "bicycle",withConfiguration: configuration)
        deliversButton.setImage(bikeImage, for: .normal)
        deliversButton.imageView?.tintColor = .white
        deliversButton.imageView?.contentMode = .scaleAspectFit
        deliversButton.setTitle("Delivers", for: .normal)
        deliversButton.setTitleColor(.white, for: .normal)
        deliversButton.backgroundColor = .systemGreen
    }
    
    func layout() {
        //Add SubView
        view.addSubview(headerView)
        view.addSubview(tableView)
        view.addSubview(deliversButton)
        
        //AutoLayout
        headerView.snp.makeConstraints { make in
            headerViewTopContraint = make.top.equalToSuperview().constraint
            make.height.equalTo(headerViewHeightConstant)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        deliversButton.snp.makeConstraints { make in
            make.width.equalTo(165)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-16)
            make.trailing.equalToSuperview().offset(-32)
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    //func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
    //    return tableView.rowHeight
   // }
    
    //Animation
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //Delivers Button
        let y = scrollView.contentOffset.y
        let swipeDown = (y >= preY)
        if preY - y <= 0 {
            print("올라갑니다")
            deliversButton.backgroundColor = .blue
        } else {
            print("내려갑니다")
            deliversButton.backgroundColor = .black
        }
        
        UIView.animate(withDuration: 1, delay: 0, options:[], animations: {
            //self.deliversButton.layer.cornerRadius = swipeDown ? 0.5 * 10 : 0.5 * 60
            self.deliversButton.frame = CGRect(x: 100, y: 400, width: 200, height: 200)
            //if swipeDown {
                //self.deliversButton.snp.updateConstraints { make in
                   // make.width.equalTo(60)
               // }
            //} else {
                //self.deliversButton.snp.updateConstraints { make in
                   // make.width.equalTo(165)
               // }
           // }
            //self.deliversButton.layer.cornerRadius = 0.5 * 30
        })
        
        
        //HeaderView
        let remainY: CGFloat = headerViewHeightConstant - y
        
        if remainY > headerMaxHeight { //내리는 경우
            headerViewTopContraint.update(offset: 0) // 상단에 고정
        } else if remainY < headerMinHeight { // headerview 일정 부분 고정 // headerView 다 올라간 후
            headerViewTopContraint.update(offset: -(headerMaxHeight - headerMinHeight))
            headerView.alphaView.alpha = 1
        } else { // headerView 이동
            headerViewHeightConstant = remainY
            headerViewTopContraint.update(offset: -(headerMaxHeight - remainY))
            
            headerView.alphaView.alpha = (headerMaxHeight - remainY) / headerMaxHeight
            
            scrollView.contentOffset.y = 0
        }
        
        preY = y
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: FrequencyView.cellId, for: indexPath)
//            return cell
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: FrequencyView.cellId, for: indexPath) as! FrequencyView
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//
//        cell.textLabel?.text = testArray[indexPath.row]
//        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        
        return cell
    }
}


