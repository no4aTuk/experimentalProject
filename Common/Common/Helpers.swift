//
//  Helpers.swift
//  Common
//
//  Created by itsmuffintime on 05.02.2020.
//  Copyright © 2020 itsmuffintime. All rights reserved.
//

import Foundation
import UIKit

public enum AppImages {
  static let icons_pack = UIImage.getImageFromBundle(image: "icons_pack")
  static let icons_euro = UIImage.getImageFromBundle(image: "icons_euro")
}

public extension Bundle {
  static let common: Bundle = Bundle(identifier: "muffin.Common")!
}

func getImageFromBundle(image: String) -> UIImage? {
  if let image = UIImage(named: image, in: Bundle.main, with: nil) {
    return image
  }
  return UIImage(named: image, in: Bundle.common, with: nil)
}

public extension UIImage {
  static func getImageFromBundle(image: String) -> UIImage? {
    if let image = UIImage(named: image, in: Bundle.main, with: nil) {
      return image
    }
    return UIImage(named: image, in: Bundle.common, with: nil)
  }
}
