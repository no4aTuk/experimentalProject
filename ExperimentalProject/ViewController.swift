//
//  ViewController.swift
//  ExperimentalProject
//
//  Created by itsmuffintime on 05.02.2020.
//  Copyright © 2020 itsmuffintime. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var label: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    //printFonts()
    setFont()
  }
  
  private func printFonts() {
    for family: String in UIFont.familyNames
    {
        print(family)
        for names: String in UIFont.fontNames(forFamilyName: family)
        {
            print("== \(names)")
        }
    }
  }
  
  private func setFont() {
//    guard let customFont = UIFont(name: "AllcanDEMORegular", size: 24) else {
//        fatalError("""
//            Failed to load the "Remachine Script Personal Use" font.
//            Make sure the font file is included in the project and the font name is spelled correctly.
//            """
//        )
//    }
//    label.font = UIFontMetrics.default.scaledFont(for: customFont)
    label.font = UIFont.systemFont(ofSize: 24)
  }
}

