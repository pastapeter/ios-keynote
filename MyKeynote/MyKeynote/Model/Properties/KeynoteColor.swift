//
//  RGBA.swift
//  MyKeynote
//
//  Created by Jung peter on 7/17/23.
//

import Foundation

class KeynoteColor: CustomStringConvertible {
  
  var R: UInt8
  var G: UInt8
  var B: UInt8
  var A: Alpha = .ten
  
  init(R: UInt8, G: UInt8, B: UInt8, A: Alpha) {
    self.R = R
    self.G = G
    self.B = B
    self.A = A
  }
  
  init(R: UInt8, G: UInt8, B: UInt8) {
    self.R = R
    self.G = G
    self.B = B
  }
  
  var description: String {
    return "R:\(R), G:\(G), B:\(B), Alpha: \(A.rawValue)"
  }

  static func random<G: RandomNumberGenerator>(using generator: inout G) -> KeynoteColor {
    let red = UInt8.random(in: 0...255, using: &generator)
    let green = UInt8.random(in: 0...255, using: &generator)
    let blue = UInt8.random(in: 0...255, using: &generator)
    let alpha = Alpha.ten
    return KeynoteColor(R: red, G: green, B: blue, A: alpha)
  }
  
  static func random() -> KeynoteColor {
    var g = SystemRandomNumberGenerator()
    return random(using: &g)
  }

}

extension KeynoteColor {
  func tohexString() -> String {
    return [R,G,B].map { String(format: "%02lX", $0) }.reduce("#", +)
  }
}
