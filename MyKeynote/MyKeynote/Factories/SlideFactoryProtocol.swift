//
//  SlideFactoryProtocol.swift
//  MyKeynote
//
//  Created by Jung peter on 7/18/23.
//

import Foundation

protocol SlideFactoryProtocol {
  func makeSlide<Slide: BaseSlide, G: RandomNumberGenerator>(type: Slide.Type, using generator: inout G) -> Slide
  func makeSlide<Slide: BaseSlide>(type: Slide.Type) -> Slide
  func makeSlideWithSquare<Slide: BaseSlide>(slide: Slide.Type) -> Slide
}


