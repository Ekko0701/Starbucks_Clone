//
//  HomeViewController.swift
//  Starbucks_Clone
//
//  Created by Corder Collie on 2022/06/30.
//

import UIKit

class HomeViewController: CommonViewController {
    override func viewDidLoad() {
        print("Home - viewDidLoad()")
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Home")
    }
}
