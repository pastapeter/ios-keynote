//
//  PresentingViewController.swift
//  MyKeynote
//
//  Created by Jung peter on 7/19/23.
//

import UIKit

protocol PresentingOutputDelegate: AnyObject {
  func output(didSelectFromSlideView uuid: keynoteUUID)
  func didTouchOnSlideView()
}

class PresentingViewController: UIViewController {
  
  var currentShapes: [Shape] = []
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
    addObservers()
    slideView.delegate = self
    slideView.datasource = self
  }
  
  private func addObservers() {
    NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNotification), name: NotificationCenterConstant.Slide.name, object: nil)
  }
  
  @objc
  func didReceiveNotification(_ notification: Notification) {
    if notification.name == NotificationCenterConstant.SlideChange.name {
      reloadData()
    } else if notification.name == NotificationCenterConstant.Shape.name {
      guard let uuid = notification.userInfo?["UUID"] as? keynoteUUID, let shape = notification.userInfo?["Shape"] as? Shape else { return }
      slideView(slideView, editByUUID: uuid, shape: shape)
    }
    
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
    slideView.reloadData()
  }
  
}

// MARK: - ComponentEventDelegate

extension PresentingViewController: ComponentEventDelegate {
  
  func didTouchSlide() {
    self.outputDelegate?.didTouchOnSlideView()
  }
  
  
  func didTouch(with uuid: keynoteUUID) {
    self.outputDelegate?.output(didSelectFromSlideView: uuid)
  }
  
}

// MARK: - SlideDataSource
extension PresentingViewController: SlideViewDatasource {
  
  func numberOfShapeView() -> Int {
    return currentShapes.count
  }
  
  func slideView(_ slideView: SlideView, ShapeViewIndexAt index: Int) -> ShapeView {
    return slideView.makeShapeView(with: currentShapes[index])
  }
  
  func slideView(_ slideView: SlideView, editByUUID uuid: keynoteUUID, shape: Shape) {
    slideView.reloadsubView(with: uuid, by: shape)
  }
  
}
