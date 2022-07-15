//
//  Common.swift
//  Starbucks_Clone
//

import UIKit

extension UIColor {
    static let tapBarWhite = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 0.7)
    static let tapSelectGreen = UIColor(red: 0/255, green: 171/255, blue: 90/255, alpha: 1)
}

extension UIView {
    func resizeImage(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage {
         UIGraphicsBeginImageContext(CGSize(width: width, height: height))
         image.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
         let newImage = UIGraphicsGetImageFromCurrentImageContext()
         UIGraphicsEndImageContext()
         return newImage!
     }
}
