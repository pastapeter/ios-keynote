//
//  SquareSlide.swift
//  MyKeynote
//
//  Created by Jung peter on 7/17/23.
//

import Foundation

final class SlideFactory: SlideFactoryProtocol {
  
  func makeSlide<Slide, G>(type: Slide.Type, using generator: inout G) -> Slide where Slide : BaseSlide, G : RandomNumberGenerator {
    return type.init(id: SlideUUID(), width: Int.random(in: 0..<Int.max, using: &generator), backgroundColor: SlideColor.random(using: &generator))
  }
  
  func makeSlide<Slide>(type: Slide.Type, width: Int) -> Slide where Slide : BaseSlide {
    return type.init(id: SlideUUID(), width: width, backgroundColor: SlideColor.random())
  }
  
  
  func makeSlide<Slide>(type: Slide.Type) -> Slide where Slide : BaseSlide {
    var g = SystemRandomNumberGenerator()
    return type.init(id: SlideUUID(), width: Int.random(in: 0..<Int.max, using: &g), backgroundColor: SlideColor.random())
  }
  
}




