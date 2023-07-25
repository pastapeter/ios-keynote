//
//  SquareSlide.swift
//  MyKeynote
//
//  Created by Jung peter on 7/17/23.
//

import Foundation

final class BaseSlideFactory: SlideFactoryProtocol {
  
  func makeSlide<Slide, G>(type: Slide.Type, using generator: inout G) -> Slide where Slide : BaseSlide, G : RandomNumberGenerator {
    return type.init(id: keynoteUUID(), width: Int.random(in: 0..<Int.max, using: &generator), backgroundColor: KeynoteColor.random(using: &generator))
  }
  
  func makeSlide<Slide>(type: Slide.Type) -> Slide where Slide : BaseSlide {
    var g = SystemRandomNumberGenerator()
    return type.init(id: keynoteUUID(), width: Int.random(in: 0..<Int.max, using: &g), backgroundColor: KeynoteColor.random())
  }
  
  func makeSlideWithSquare<Slide: BaseSlide>(slide: Slide.Type) -> Slide {
    var slideWithSquare = slide.init(id: keynoteUUID(), width: Int.random(in: 0..<Int.max), backgroundColor: KeynoteColor.random())
    slideWithSquare.addShape(ShapeInfoFactory.createShapeInfo(type: Square.self))
    return slideWithSquare
  }
  
}

extension BaseSlideFactory {
  
  
}

protocol ImageContainable: Shape {
  init(id: keynoteUUID, width: Int, imageData: Data)
}




