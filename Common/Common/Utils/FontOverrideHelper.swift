//
//  FontOverrideHelper.swift
//  Common
//
//  Created by itsmuffintime on 05.02.2020.
//  Copyright © 2020 itsmuffintime. All rights reserved.
//

import Foundation
import UIKit

//== Palatino-Italic
//== Palatino-Roman
//== Palatino-BoldItalic
//== Palatino-Bold

public struct AppFontName {
  public static var shared: AppFontName!
  public let regular: String// = "Palatino-Roman"//"Georgia"
  public let bold: String //"Palatino-Bold"//"Georgia-Bold"
  public let italic: String //"Palatino-Italic"//"Georgia-Italic"
  
  public init(reg: String, bold: String, ital: String) {
    self.regular = reg
    self.bold = bold
    self.italic = ital
  }
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {

    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
      return UIFont(name: AppFontName.shared.regular, size: size)!
    }

    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
      return UIFont(name: AppFontName.shared.bold, size: size)!
    }

    @objc class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
      return UIFont(name: AppFontName.shared.italic, size: size)!
    }
  
  @objc class func myDynamicSystemFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
    switch weight {
    case .regular:  return mySystemFont(ofSize: size)
    case .bold:     return myBoldSystemFont(ofSize: size)
    default:        return UIFont(name: AppFontName.shared.regular, size: size)!
    }
  }

    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage":
          fontName = AppFontName.shared.regular
        case "CTFontEmphasizedUsage", "CTFontBoldUsage":
          fontName = AppFontName.shared.bold
        case "CTFontObliqueUsage":
          fontName = AppFontName.shared.italic
          
          //TODO create font
        case "CTFontUltraLightUsage", "CTFontThinUsage",
             "CTFontLightUsage", "CTFontMediumUsage",
             "CTFontDemiUsage",
             "CTFontHeavyUsage", "CTFontBlackUsage":
          
          fontName = AppFontName.shared.regular
        default:
          fontName = AppFontName.shared.regular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }

    public class func overrideInitialize() {
        guard self == UIFont.self else { return }

        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }

        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }

        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
            let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }
      
      if let dynamycSystemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:weight:))),
        let myDynamicSystemFontMethod = class_getClassMethod(self, #selector(myDynamicSystemFont(ofSize:weight:))) {
        method_exchangeImplementations(dynamycSystemFontMethod, myDynamicSystemFontMethod)
      }

        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}
