//
//  SlideView.swift
//  MyKeynote
//
//  Created by Jung peter on 7/20/23.
//

import UIKit

protocol ViewSelectable: UIView {
  func didTouched()
}

protocol ViewMovable: UIView {
  func didMove()
}

class ShapeView: UIView, ViewSelectable, ViewMovable {
  
  weak var delegate: ComponentEventDelegate?
  private var uuid: keynoteUUID
  
  init(frame: CGRect, uuid: keynoteUUID) {
    self.uuid = uuid
    super.init(frame: frame)
    setTapGesture()
  }
  
  required init?(coder: NSCoder, uuid: keynoteUUID) {
    self.uuid = uuid
    super.init(coder: coder)
    setTapGesture()
  }
  
  required init?(coder: NSCoder) {
    self.uuid = keynoteUUID()
    super.init(coder: coder)
    setTapGesture()
  }
  
  func didMove() {
    return
  }
  
  func didTouched() {
    delegate?.didTouch(with: self.uuid)
  }
  
  private func setTapGesture() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
    self.addGestureRecognizer(tapGesture)
  }
  
  @objc
  func handleTap(sender: UITapGestureRecognizer) {
    didTouched()
  }
  
    
}

class TriangleView: ShapeView {
  
  override func draw(_ rect: CGRect) {
    return
  }
  
}

class RectView: ShapeView {
  
}

class SquareView: RectView {
  
}

protocol ComponentEventDelegate: AnyObject {
  func didTouch(with uuid: keynoteUUID)
  func didTouchSlide()
}

extension ComponentEventDelegate {
  
  func didTouch(with uuid: keynoteUUID) { }
  
  func didTouchSlide() { }
  
}
