//
//  SlideManager.swift
//  MyKeynote
//
//  Created by Jung peter on 7/19/23.
//

import Foundation

protocol SlideManageable {
  var numberOfSlides: Int { get }
  mutating func createSlide<Slide: BaseSlide>(of slideType: Slide.Type)
  subscript(index: Int) -> BaseSlide? { get }
}

struct SlideManager: SlideManageable {
  
  private var slides: [BaseSlide]
  private var slideFactory: SlideFactoryProtocol
  
  init(slides: [BaseSlide], slideFactory: SlideFactoryProtocol) {
    self.slides = slides
    self.slideFactory = slideFactory
  }
  
  var numberOfSlides: Int {
    return slides.count
  }
  
  mutating func createSlide<Slide>(of slideType: Slide.Type) where Slide : BaseSlide {
//    let slide = slideFactory.makeSlide(type: slideType.self)
    let slide = slideFactory.makeSlideWithSquare(slide: slideType.self)
    slides.append(slide)
  }
  
  subscript(index: Int) -> BaseSlide? {
    if index >= numberOfSlides { return nil }
    return slides[index]
  }
}
