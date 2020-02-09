//
//  FontConfig.swift
//  Common
//
//  Created by itsmuffintime on 09.02.2020.
//  Copyright © 2020 itsmuffintime. All rights reserved.
//

import Foundation
import UIKit

public class FontConfigItem: Codable {
  var type: AppFontType = .regular
  var size: CGFloat = 10.0
  
  var font: UIFont {
    
    switch type {
    case .regular: return .systemFont(ofSize: size)//.systemFont(ofSize: fontSize, weight: .regular)
    case .bold: return .boldSystemFont(ofSize: size)
    case .italic: return .italicSystemFont(ofSize: size)
    case .medium: return .systemFont(ofSize: size, weight: .medium)
    }
    //return UIFont(name: self.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
  }
}

public enum AppFontType: String, Codable {
  case regular
  case bold
  case italic
  case medium
  
//  var fontSize: CGFloat {
//    switch self {
//    case .regular: return 16
//    case .bold: return 20
//    case .italic: return 18
//    case .medium: return 17
//    }
//  }
//
//  var font: UIFont {
//    switch self {
//    case .regular: return .systemFont(ofSize: fontSize)//.systemFont(ofSize: fontSize, weight: .regular)
//    case .bold: return .boldSystemFont(ofSize: fontSize)
//    case .italic: return .italicSystemFont(ofSize: fontSize)
//    case .medium: return .systemFont(ofSize: fontSize, weight: .medium)
//    }
//    //return UIFont(name: self.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
//  }
}

//TODO think about
enum FontConfigEnum {
  case titleFont
  case subTitleFont
  case descriptionFont
}

extension UIFont {
  static func appFont(fontType: FontConfigEnum) -> UIFont {
    switch fontType {
    case .titleFont:        return ThemeManager.shared.fontConfig.titleFont.font
    case .subTitleFont:     return ThemeManager.shared.fontConfig.subTitleFont.font
    case .descriptionFont:  return ThemeManager.shared.fontConfig.descriptionFont.font
    }
  }
}
//END TODO think about

public class FontConfig: Codable {
  public var titleFont: FontConfigItem = .init()
  public var subTitleFont: FontConfigItem = .init()
  public var descriptionFont: FontConfigItem = .init()

  public static func loadConfig() -> FontConfig {
    do {
      let resourceURL = Bundle.main.url(forResource: "font_config", withExtension: "plist")!
      let data = try Data(contentsOf: resourceURL)
      //return try JSONDecoder().decode(FontConfig.self, from: data)
      return try PropertyListDecoder().decode(FontConfig.self, from: data)
    } catch {
      fatalError("Error load config")
    }
  }
}


