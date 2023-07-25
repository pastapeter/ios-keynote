//
//  Shape.swift
//  MyKeynote
//
//  Created by Jung peter on 7/20/23.
//

import Foundation

class Shape: BaseComponent, ShapeProtocol {
  
  var isSelected: Bool = true
  private(set) var origin: (x: Double, y: Double) = (x:0, y:0)
  
  required init(id: keynoteUUID, width: Int, height: Int, backgroundColor: KeynoteColor, origin: (x: Double, y: Double)) {
    self.origin = origin
    super.init(id: id, width: width, height: height, backgroundColor: backgroundColor)
  }
  
  func move(x: Double, y: Double) {
    self.origin = (x, y)
  }
  
}
