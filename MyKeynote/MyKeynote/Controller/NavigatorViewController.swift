//
//  NavigatorViewController.swift
//  MyKeynote
//
//  Created by Jung peter on 7/19/23.
//

import UIKit

class NavigatorViewController: UIViewController {
  
  enum Constant {
    static let slideMaxWidth = Int(UIScreen.main.bounds.width - 360)
  }
  
  private var slideManager: SlideManageable
  
  init(slideManager: SlideManageable) {
    self.slideManager = slideManager
    super.init(nibName: nil, bundle: nil)
  }
  
  convenience init() {
    var slideManager = SlideManager(slides: [], slideFactory: BaseSlideFactory(maxWidth: Constant.slideMaxWidth), shapeInfoFactory: ShapeInfoFactory())
    slideManager.createSlide(of:BaseSlide.self)
    self.init(slideManager: slideManager)
  }
  
  required init?(coder: NSCoder, slideManager: SlideManageable) {
    self.slideManager = slideManager
    super.init(coder: coder)
  }
  
  required convenience init?(coder: NSCoder) {
    let slideManager = SlideManager(slides: [], slideFactory: BaseSlideFactory(maxWidth: Constant.slideMaxWidth), shapeInfoFactory: ShapeInfoFactory())
    self.init(coder: coder, slideManager: slideManager)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemGray4
    getCurrentSlide()
  }
  
  func getCurrentSlide() {
    let currentSlide = slideManager[0]
  }
  
  func getFirstSlide() -> BaseSlide? {
    return slideManager[0]
  }

}
