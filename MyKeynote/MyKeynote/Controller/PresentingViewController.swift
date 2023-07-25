//
//  PresentingViewController.swift
//  MyKeynote
//
//  Created by Jung peter on 7/19/23.
//

import UIKit

protocol PresentingOutputDelegate: AnyObject {
  func output(didSelectFromSlideView shape: Shape)
  func didTouchOnSlideView()
}

class PresentingViewController: UIViewController {
  
  weak var navigateDatasource: NavigatorDataSource?
  weak var outputDelegate: PresentingOutputDelegate?
  
  private var slideView: SlideView = {
    let view = SlideView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemGray2
    setupSlideView()
  }
  
  func reloadData() {
    reloadSlideView()
  }
    
}

// MARK: - Private Method

extension PresentingViewController {
  
  private func setupSlideView() {
    view.addSubview(slideView)
    
    slideView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    slideView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    slideView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    slideView.heightAnchor.constraint(equalTo: slideView.widthAnchor, multiplier: 3/4).isActive = true
  }
 
  private func reloadSlideView() {
    guard let datasource = navigateDatasource, let slideInfo = datasource.selectedSlideInfo() else { return }
    slideView.setslideInfo(info: slideInfo)
    slideView.delegate = self
  }
  
}

extension PresentingViewController: ComponentEventDelegate {
  
  func didTouchSlide() {
    self.outputDelegate?.didTouchOnSlideView()
  }
  
  
  func didTouch(with shape: Shape) {
    self.outputDelegate?.output(didSelectFromSlideView: shape)
  }
  
}
