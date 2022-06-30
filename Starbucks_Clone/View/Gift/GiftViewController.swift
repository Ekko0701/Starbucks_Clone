//
//  GiftViewController.swift
//  Starbucks_Clone
//

import UIKit

class GiftViewController: CommonViewController {
    override func viewDidLoad() {
        print("Gift - viewDidLoad()")
        
    }
    override func commonInit() {
        setTabBarImage(imageName: "gift.fill", title: "Gift")
    }
}
