//
//  OrderViewController.swift
//  Starbucks_Clone
//

import UIKit

class OrderViewController: CommonViewController {
    override func viewDidLoad() {
        print("Order - viewDidLoad()")
        
    }
    override func commonInit() {
        setTabBarImage(imageName: "cup.and.saucer.fill", title: "Order")
    }
}
