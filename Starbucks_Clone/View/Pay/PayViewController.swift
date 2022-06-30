//
//  PayViewController.swift
//  Starbucks_Clone
//

import UIKit

class PayViewController: CommonViewController {
    override func viewDidLoad() {
        print("Pay - viewDidLoad()")
    }
    
    
    override func commonInit(){
        setTabBarImage(imageName: "creditcard.fill", title: "Pay")
    }
}
