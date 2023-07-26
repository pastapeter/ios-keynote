//
//  Slide.swift
//  MyKeynote
//
//  Created by Jung peter on 7/17/23.
//

import Foundation

enum AspectRatio {
  case ratio4_3
  case square
  
  var multiplier: Double {
    switch self {
    case .ratio4_3:
      return 3/4
    case .square:
      return 1.0
    }
  }
}


class BaseSlide: BaseComponent, ComponentInspectable, SlideInitable, ShapeStorable {
  
  var aspectRatio: AspectRatio {
    return .ratio4_3
  }
  
  private(set) var shapes: [ShapeInfo] = []
  
  override var height: Int {
    return Int(Double(width) * aspectRatio.multiplier)
  }
  
  required override init(id: keynoteUUID, width: Int, backgroundColor: KeynoteColor) {
    super.init(id: id, width: width, backgroundColor: backgroundColor)
  }
  
  override func setBackgroundColor(red: UInt8, blue: UInt8, green: UInt8) {
    super.setBackgroundColor(red: red, blue: blue, green: green)
    NotificationCenter.default.post(name: NotificationCenterConstant.didChangeBackgroundColor.name, object: self, userInfo: ["BackgroundColor": self.backgroundColor])
  }
  
  override func setWidth(to length: Int) {
    super.setWidth(to: length)
    NotificationCenter.default.post(name: NotificationCenterConstant.didChangeWidth.name, object: self)
  }
  
  func setAlpha(to alpha: Alpha) {
    super.setBackgroundAlpha(alpha: alpha)
    NotificationCenter.default.post(name: NotificationCenterConstant.didChangeAlpha.name, object: self)
  }
  
}

extension BaseSlide {
  
  func find(_ uuid: keynoteUUID) -> ShapeInfo? {
    return self.shapes.first(where: { $0.shape.id == uuid })
  }
  
  func addShape(_ shape: ShapeInfo) {
    self.shapes.append(shape)
    NotificationCenter.default.post(name: NotificationCenterConstant.SlideChange.name, object: nil)
  }
  
  func insertShape(_ shape: ShapeInfo, at index: Int) {
    self.shapes.insert(shape, at: index)
    NotificationCenter.default.post(name: NotificationCenterConstant.SlideChange.name, object: nil)
  }
  
  func brintShapeToFront(_ shape: ShapeInfo) {
    guard let index = self.shapes.firstIndex(of: shape) else { return }
    let shape = self.shapes.remove(at: index)
    self.shapes.insert(shape, at: 0)
    NotificationCenter.default.post(name: NotificationCenterConstant.SlideChange.name, object: nil)
  }
  
  func sendShapeToBack(_ shape: ShapeInfo) {
    guard let index = self.shapes.firstIndex(of: shape) else { return }
    self.shapes.append(self.shapes.remove(at: index))
    NotificationCenter.default.post(name: NotificationCenterConstant.SlideChange.name, object: nil)
  }
  
  func removeShape(_ shape: ShapeInfo) {
    guard let index = self.shapes.firstIndex(of: shape) else { return }
    self.shapes.remove(at: index)
    NotificationCenter.default.post(name: NotificationCenterConstant.SlideChange.name, object: nil)
  }
  
  
}
