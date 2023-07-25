//
//  ShapeInspector.swift
//  MyKeynote
//
//  Created by Jung peter on 7/24/23.
//

import Foundation

protocol ComponentInspectable: AnyObject {
  func setBackgroundColor(red: UInt8, blue: UInt8, green: UInt8)
  func setAlpha(to alpha: Alpha)
}

class ShapeInspector: ComponentInspectable {
  
  func setBackgroundColor(red: UInt8, blue: UInt8, green: UInt8) {
    shape.setBackgroundColor(red: red, blue: blue, green: green)
  }
  
  func setAlpha(to alpha: Alpha) {
    return shape.setBackgroundAlpha(alpha: alpha)
  }
  
  private var shape: Shape
  
  init(shape: Shape) {
    self.shape = shape
  }
  
}

class RectInspector: ShapeInspector {
  
}
