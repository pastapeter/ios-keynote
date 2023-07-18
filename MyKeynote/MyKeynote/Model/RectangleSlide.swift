//
//  RectangleSlide.swift
//  MyKeynote
//
//  Created by Jung peter on 7/19/23.
//

import Foundation

class RectangleSlide: BaseSlide {
  
  final override var aspectRatio: AspectRatio {
    return .ratio4_3
  }
  
  final override var height: Int {
    return Int(Double(width) * aspectRatio.multiplier)
  }
  
}
