//
//  Shape.swift
//  MyKeynote
//
//  Created by Jung peter on 7/20/23.
//

import Foundation

class Shape: BaseComponent, ShapeProtocol {

  private(set) var origin: (x: Int, y: Int) = (x:0, y:0)
  
  required init(id: keynoteUUID, width: Int, height: Int, backgroundColor: KeynoteColor, origin: (x: Int, y: Int)) {
    self.origin = origin
    super.init(id: id, width: width, height: height, backgroundColor: backgroundColor)
  }
  
  func move(x: Int, y: Int) {
    self.origin = (x, y)
    NotificationCenter.default.post(name: NotificationCenterConstant.didChangeShapeComponent.name, object: nil, userInfo: ["Shape": self])
  }
  
  override func setWidth(to length: Int) {
    super.setWidth(to: length)
    NotificationCenter.default.post(name: NotificationCenterConstant.didChangeShapeComponent.name, object: nil, userInfo: ["Shape": self])
  }
  
  override func setHeight(to length: Int) {
    super.setHeight(to: length)
    NotificationCenter.default.post(name: NotificationCenterConstant.didChangeShapeComponent.name, object: nil, userInfo: ["Shape": self])
  }
  
  override func setBackgroundAlpha(alpha: Alpha) {
    super.setBackgroundAlpha(alpha: alpha)
    NotificationCenter.default.post(name: NotificationCenterConstant.didChangeShapeComponent.name, object: nil, userInfo: ["Shape": self])
  }
  
  override func setBackgroundColor(red: UInt8, blue: UInt8, green: UInt8) {
    super.setBackgroundColor(red: red, blue: blue, green: green)
    NotificationCenter.default.post(name: NotificationCenterConstant.didChangeShapeComponent.name, object: nil, userInfo: ["Shape": self])
  }
  
  override func setBackgroundColor(red: UInt8, blue: UInt8, green: UInt8, alpha: Alpha) {
    super.setBackgroundColor(red: red, blue: blue, green: green, alpha: alpha)
    NotificationCenter.default.post(name: NotificationCenterConstant.didChangeShapeComponent.name, object: nil, userInfo: ["Shape": self])
  }
  
  
  
}


