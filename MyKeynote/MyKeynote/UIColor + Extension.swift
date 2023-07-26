//
//  UIColor + Extension.swift
//  MyKeynote
//
//  Created by Jung peter on 7/25/23.
//

import UIKit

extension UIColor {
  
  convenience init?(from keynoteColor: KeynoteColor) {
    self.init(red: CGFloat(keynoteColor.R) / 255, green: CGFloat(keynoteColor.G) / 255, blue: CGFloat(keynoteColor.B) / 255, alpha: Double(keynoteColor.A.rawValue) / 10)
  }
  
  var hexString: String {
          guard let components = cgColor.components else { return "" }
          return components[0..<3]
              .map { String(format: "%02lX", Int($0 * 255)) }
              .reduce("#", +)
      }
  
}
