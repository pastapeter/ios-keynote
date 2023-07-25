//
//  NavigatorViewController.swift
//  MyKeynote
//
//  Created by Jung peter on 7/19/23.
//

import UIKit

protocol NavigatorDataSource: AnyObject {
  func selectedSlideInfo() -> BaseSlide?
}

class NavigatorViewController: UIViewController, NavigatorDataSource  {
  
  private var slideManager: SlideManageable
  
  init(slideManager: SlideManageable) {
    self.slideManager = slideManager
    super.init(nibName: nil, bundle: nil)
  }
  
  convenience init() {
    var slideManager = SlideManager(slides: [], slideFactory: BaseSlideFactory())
    slideManager.createSlide(of:BaseSlide.self)
    self.init(slideManager: slideManager)
  }
  
  required init?(coder: NSCoder, slideManager: SlideManageable) {
    self.slideManager = slideManager
    super.init(coder: coder)
  }
  
  required convenience init?(coder: NSCoder) {
    let slideManager = SlideManager(slides: [], slideFactory: BaseSlideFactory())
    self.init(coder: coder, slideManager: slideManager)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemGray4
  }

  
}


extension NavigatorViewController {
  
  func selectedSlideInfo() -> BaseSlide? {
    return slideManager[0]
  }
  
}
