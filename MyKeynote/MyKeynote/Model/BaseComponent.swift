//
//  Shape.swift
//  MyKeynote
//
//  Created by Jung peter on 7/20/23.
//

import Foundation

protocol HeightSettable {
  func setHeight(to length: Int)
}

class BaseComponent: WidthSettable, HeightSettable, Hashable, CustomStringConvertible {
  
  static func == (lhs: BaseComponent, rhs: BaseComponent) -> Bool {
    lhs.id == rhs.id
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  private(set) var id: keynoteUUID
  private(set) var width: Int
  private(set) var backgroundColor: KeynoteColor
  private(set) var height: Int = 0
  
  init(id: keynoteUUID, width: Int, backgroundColor: KeynoteColor) {
    self.backgroundColor = backgroundColor
    self.id = id
    self.width = width
  }
  
  init(id: keynoteUUID, width: Int, height: Int, backgroundColor: KeynoteColor) {
    self.backgroundColor = backgroundColor
    self.id = id
    self.width = width
    self.height = height
  }
  
  var alpha: Alpha {
    return backgroundColor.A
  }
  
  func setWidth(to length: Int) {
    self.width = length
  }
  
  func setHeight(to length: Int) {
    self.height = length
  }
  
  func setBackgroundAlpha(alpha: Alpha) {
    self.backgroundColor = .init(R: self.backgroundColor.R, G: self.backgroundColor.G, B: self.backgroundColor.B, A: alpha)
  }
  
  func setBackgroundColor(red: UInt8, blue: UInt8, green: UInt8, alpha: Alpha) {
    self.backgroundColor = KeynoteColor(R: UInt8(red), G: UInt8(green), B: UInt8(blue), A: alpha)
  }
  
  func setBackgroundColor(red: UInt8, blue: UInt8, green: UInt8) {
    self.backgroundColor = KeynoteColor(R: UInt8(red), G: UInt8(green), B: UInt8(blue))
  }
  
  var description: String {
    return "(\(self.id.description)), Side:\(self.width), \(self.backgroundColor.description)"
  }
  
}
