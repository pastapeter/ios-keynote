//
//  Slide.swift
//  MyKeynote
//
//  Created by Jung peter on 7/17/23.
//

import Foundation

enum AspectRatio {
  case ratio4_3
  
  var multiplier: Double {
    switch self {
    case .ratio4_3:
      return 3/4
    }
  }
}

protocol ColorSettable {
  func setColor(red:Int,blue: Int, green: Int, alpha: Alpha)
}

protocol WidthSettable {
  func setWidth(to length: Int)
}

protocol Typeinitiable {
  init(id: SlideUUID, width: Int, backgroundColor: SlideColor)
}

class BaseSlide: ColorSettable, WidthSettable, Typeinitiable, CustomStringConvertible {
  
  private var id: SlideUUID
  private var width: Int
  private var backgroundColor: SlideColor
  private var aspectRatio: AspectRatio = .ratio4_3
  
  final var height: Int {
    return Int(Double(width) * aspectRatio.multiplier)
  }
  
  required init(id: SlideUUID, width: Int, backgroundColor: SlideColor) {
    self.id = id
    self.width = width
    self.backgroundColor = backgroundColor
  }
  
  func setColor(red: Int, blue: Int, green: Int, alpha: Alpha) {
    self.backgroundColor = SlideColor(R: UInt8(red), G: UInt8(green), B: UInt8(blue), A: alpha)
  }
  
  func setWidth(to length: Int) {
    self.width = length
  }
  
  var description: String {
    return "(\(self.id.description)), Side:\(self.width), \(self.backgroundColor.description)"
  }
  
}

protocol Resizable {
  func resize() 
}
