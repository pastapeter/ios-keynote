//
//  SquareSlide.swift
//  MyKeynote
//
//  Created by Jung peter on 7/17/23.
//

import Foundation
import UIKit

final class BaseSlideFactory: SlideFactoryProtocol {
  
  private var maxWidth: Int
  
  init(maxWidth: Int) {
    self.maxWidth = maxWidth
  }
  
  func makeSlide<Slide, G>(type: Slide.Type, using generator: inout G) -> Slide where Slide : BaseSlide, G : RandomNumberGenerator {
    return type.init(id: keynoteUUID(), width: maxWidth, backgroundColor: KeynoteColor(R: 255, G: 255, B: 255, A: .ten))
  }
  
  func makeSlide<Slide>(type: Slide.Type) -> Slide where Slide : BaseSlide {
    return type.init(id: keynoteUUID(), width: maxWidth, backgroundColor: KeynoteColor(R: 255, G: 255, B: 255, A: .ten))
  }
  
}

protocol ImageContainable: Shape {
  init(id: keynoteUUID, width: Int, imageData: Data)
}




