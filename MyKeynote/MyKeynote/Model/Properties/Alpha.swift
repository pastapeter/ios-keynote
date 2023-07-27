//
//  Alpha.swift
//  MyKeynote
//
//  Created by Jung peter on 7/17/23.
//

import UIKit

enum Alpha: Int, CaseIterable {
  case one = 1
  case two
  case three
  case four
  case five
  case six
  case seven
  case eight
  case nine
  case ten
  
  static func random<G: RandomNumberGenerator>(using generator: inout G) -> Alpha {
    return Alpha.allCases.randomElement(using: &generator) ?? .one
  }
  
  static func random() -> Alpha {
    var g = SystemRandomNumberGenerator()
    return Alpha.random(using: &g)
  }
  
  static func max() -> Alpha {
    return .ten
  }
  
  static func min() -> Alpha {
    return .one
  }
}
