//
//  ShapeInspector.swift
//  MyKeynote
//
//  Created by Jung peter on 7/24/23.
//

import Foundation

protocol ComponentInspectable: ColorSettable, AlphaSettable, AnyObject {
  
  var backgroundColor: KeynoteColor { get }
  var alpha: Alpha { get }
  
}

class ShapeInspector: ComponentInspectable {
  
  func setBackgroundColor(red: UInt8, blue: UInt8, green: UInt8, alpha: Alpha) {
    shape.setBackgroundColor(red: red, blue: blue, green: green, alpha: alpha)
  }
  
  func setBackgroundAlpha(alpha: Alpha) {
    shape.setBackgroundAlpha(alpha: alpha)
  }
  
  func setBackgroundColor(red: UInt8, blue: UInt8, green: UInt8) {
    shape.setBackgroundColor(red: red, blue: blue, green: green)
  }
  
  func setAlpha(to alpha: Alpha) {
    return shape.setBackgroundAlpha(alpha: alpha)
  }
  
  private var shape: Shape

  var backgroundColor: KeynoteColor {
    return shape.backgroundColor
  }
  
  var alpha: Alpha {
    return shape.backgroundColor.A
  }
  
  init(shape: Shape) {
    self.shape = shape
  }
  
}

class RectInspector: ShapeInspector {
  
}
