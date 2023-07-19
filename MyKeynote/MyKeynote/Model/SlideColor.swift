//
//  RGBA.swift
//  MyKeynote
//
//  Created by Jung peter on 7/17/23.
//

import Foundation

class SlideColor: CustomStringConvertible {
  
  var R: UInt8
  var G: UInt8
  var B: UInt8
  var A: Alpha
  
  init(R: UInt8, G: UInt8, B: UInt8, A: Alpha) {
    self.R = R
    self.G = G
    self.B = B
    self.A = A
  }
  
  var description: String {
    return "R:\(R), G:\(G), B:\(B), Alpha: \(A.rawValue)"
  }

  static func random<G: RandomNumberGenerator>(using generator: inout G) -> SlideColor {
    let red = UInt8.random(in: 0...255, using: &generator)
    let green = UInt8.random(in: 0...255, using: &generator)
    let blue = UInt8.random(in: 0...255, using: &generator)
    let alpha = Alpha.random(using: &generator)
    return SlideColor(R: red, G: green, B: blue, A: alpha)
  }
  
  static func random() -> SlideColor {
    var g = SystemRandomNumberGenerator()
    return random(using: &g)
  }
  
  
}
