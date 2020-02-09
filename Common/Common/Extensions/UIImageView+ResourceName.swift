//
//  UIImageView+ResourceName.swift
//  Common
//
//  Created by itsmuffintime on 05.02.2020.
//  Copyright © 2020 itsmuffintime. All rights reserved.
//

import Foundation
import UIKit

protocol PropertyStoring {
  
  associatedtype T
  
  func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T
}

extension PropertyStoring {
  func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T {
    guard let value = objc_getAssociatedObject(self, key) as? T else {
      return defaultValue
    }
    return value
  }
}

extension UIImageView: PropertyStoring {
  
  typealias T = String
  
  private struct CustomProperties {
    static var resource = ""
  }
  
  @IBInspectable
  var resourceName: String {
    get {
      return getAssociatedObject(&CustomProperties.resource,
                                 defaultValue: CustomProperties.resource)
    }
    set {
      return objc_setAssociatedObject(self, &CustomProperties.resource, newValue,
                                      .OBJC_ASSOCIATION_RETAIN)
    }
  }
  
  open override func awakeFromNib() {
    super.awakeFromNib()
    if resourceName.isEmpty == false {
      self.image = getImageFromBundle(image: resourceName)
    }
  }
}
