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
    slideView.datasource = self
  }
  
  private func addObservers() {
    NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNotification), name: NotificationCenterConstant.Slide.name, object: nil)
  }
  
  @objc
  func didReceiveNotification(_ notification: Notification) {
    if notification.name == NotificationCenterConstant.Slide.name {
      reloadData()
    } else {
      reloadShapeData(with: notification.userInfo?["UUID"] as? keynoteUUID, shape: notification.userInfo?["Shape"] as? Shape)
    }
    
  }
  
  func reloadData() {
    reloadSlideView()
  }
  
  func reloadShapeData(with uuid: keynoteUUID?, shape: Shape?) {
    guard let uuid = uuid, let shape = shape else { return }
    guard let datasource = navigateDatasource, let slideInfo = datasource.selectedSlideInfo() else { return }
    //음 근데..? 만약에 Image가 들어오면? 무슨 Shape인지 파악가능함?
    //그러면 구체타입으로 전달하나?
    //각 뷰에서 타입캐스팅해서 쓰는게 어떰?
    slideView.reloadsubView(with: uuid, by: shape)
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

extension PresentingViewController: ComponentEventDelegate {
  
  func didTouchSlide() {
    self.outputDelegate?.didTouchOnSlideView()
  }
  
  
  func didTouch(with uuid: keynoteUUID) {
    self.outputDelegate?.output(didSelectFromSlideView: uuid)
  }
  
}

extension PresentingViewController: SlideViewDatasource {
  
  func numberOfShapeView() -> Int {
    return navigateDatasource?.selectedSlideInfo()?.shapes.count ?? 0
  }
  
  func slideView(_ slideView: SlideView, ShapeViewIndexAt index: Int) -> ShapeView {
    guard let datasource = navigateDatasource, let slideInfo = datasource.selectedSlideInfo() else { return ShapeView(frame: .zero, uuid: keynoteUUID())}
    let shapes = slideInfo.shapes.map { $0.shape }
    return slideView.makeShapeView(with: shapes[index])
  }
  
  func slideView(_ slideView: SlideView, editByUUID uuid: keynoteUUID) {
    
  }
  
}
