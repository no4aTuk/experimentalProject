//
//  AwesomeViewController.swift
//  Common
//
//  Created by itsmuffintime on 05.02.2020.
//  Copyright © 2020 itsmuffintime. All rights reserved.
//

import Foundation
import UIKit

public class AwesomeViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var ultraLightlabel: UILabel!
  @IBOutlet weak var thinlabel: UILabel!
  @IBOutlet weak var lightlabel: UILabel!
  @IBOutlet weak var regularlabel: UILabel!
  @IBOutlet weak var mediumlabel: UILabel!
  @IBOutlet weak var semiBoldlabel: UILabel!
  @IBOutlet weak var boldLabel: UILabel!
  @IBOutlet weak var heavylabel: UILabel!
  @IBOutlet weak var blacklabel: UILabel!
  @IBOutlet weak var italiclabel: UILabel!
  
  @IBOutlet weak var titlelabel: UILabel!
  @IBOutlet weak var subTitlelabel: UILabel!
  @IBOutlet weak var descriptionlabel: UILabel!
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    //setImage()
    //printFonts()
    setFonts()
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
  
  private func setImage() {
    self.imageView.image = AppImages.icons_euro
  }
  
  private func setFonts() {
    //titlelabel.font = ThemeManager.shared.fontConfig.titleFont.font //FongConfig.shared.titleFont.font
    //subTitlelabel.font = ThemeManager.shared.fontConfig.subTitleFont.font
    //descriptionlabel.font = ThemeManager.shared.fontConfig.descriptionFont.font
    titlelabel.font = .appFont(fontType: .titleFont)
    subTitlelabel.font = .appFont(fontType: .subTitleFont)
    descriptionlabel.font = .appFont(fontType: .descriptionFont)
  }
}

