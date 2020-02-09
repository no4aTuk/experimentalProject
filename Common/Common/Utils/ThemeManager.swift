//
//  ThemeManager.swift
//  Common
//
//  Created by itsmuffintime on 09.02.2020.
//  Copyright © 2020 itsmuffintime. All rights reserved.
//

import Foundation
import UIKit

public class ThemeManager {
  public static var shared: ThemeManager = ThemeManager()
  private init() {
    
  }
  
  public lazy var fontConfig: FontConfig = FontConfig.loadConfig()
}
