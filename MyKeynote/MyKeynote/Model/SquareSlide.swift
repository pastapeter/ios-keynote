//
//  SquareSlide.swift
//  MyKeynote
//
//  Created by Jung peter on 7/18/23.
//

import Foundation

class SquareSlide: BaseSlide {
  
  final override var aspectRatio: AspectRatio {
    return .square
  }
  
  final override var height: Int {
    return Int(Double(width) * aspectRatio.multiplier)
  }
  
}
