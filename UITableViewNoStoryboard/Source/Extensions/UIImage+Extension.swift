//
//  UIImage+Extension.swift
//  UITableViewNoStoryboard
//
//  Created by chloe korzh on 22/01/2023.
//  Copyright © 2023 JournalDev.com. All rights reserved.
//

import UIKit
public extension UIImage {
  func maskWithColor(color: UIColor) -> UIImage? {
    let maskLayer = CALayer()
    maskLayer.bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    maskLayer.backgroundColor = color.cgColor
    maskLayer.doMask(by: self)
    let maskImage = maskLayer.toImage()
    return maskImage
  }
}
