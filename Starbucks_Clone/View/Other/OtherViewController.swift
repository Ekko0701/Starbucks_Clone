//
//  OtherViewController.swift
//  Starbucks_Clone
//

import UIKit

class OtherViewController: CommonViewController {
    override func viewDidLoad() {
        print("Other - viewDidLoad()")
        
    }
    override func commonInit() {
        setTabBarImage(imageName: "circle.dotted", title: "Other")
    }
}
