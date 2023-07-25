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


class BaseSlide: BaseComponent, SlideInitable, ShapeStorable, ComponentInspectable {
  

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
  
  override func setBackgroundColor(red: UInt8, blue: UInt8, green: UInt8, alpha: Alpha) {
    super.setBackgroundColor(red: red, blue: blue, green: green, alpha: alpha)
  }
  
  override func setWidth(to length: Int) {
    super.setWidth(to: length)
  }
  
  func setAlpha(to alpha: Alpha) {
    super.setBackgroundAlpha(alpha: alpha)
  }
  
}

extension BaseSlide {
  
  func addShape(_ shape: ShapeInfo) {
    self.shapes.append(shape)
  }
  
  func insertShape(_ shape: ShapeInfo, at index: Int) {
    self.shapes.insert(shape, at: index)
  }
  
  func brintShapeToFront(_ shape: ShapeInfo) {
    guard let index = self.shapes.firstIndex(of: shape) else { return }
    let shape = self.shapes.remove(at: index)
    self.shapes.insert(shape, at: 0)
  }
  
  func sendShapeToBack(_ shape: ShapeInfo) {
    guard let index = self.shapes.firstIndex(of: shape) else { return }
    self.shapes.append(self.shapes.remove(at: index))
  }
  
  func removeShape(_ shape: ShapeInfo) {
    guard let index = self.shapes.firstIndex(of: shape) else { return }
    self.shapes.remove(at: index)
  }
  
  
}
