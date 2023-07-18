//
//  MainViewController.swift
//  MyKeynote
//
//  Created by Jung peter on 7/17/23.
//

import UIKit

class MainViewController: UIViewController {
  
  private var slides: [BaseSlide] = []
  private let factory = SlideFactory()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    for _ in (1...4) {
      slides.append(factory.makeSlide(type: SquareSlide.self))
    }
    
    KeynoteLogger.log(slides)
    
  }
  
}


