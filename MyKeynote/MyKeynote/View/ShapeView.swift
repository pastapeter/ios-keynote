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
  
  func updateview(by shape: Shape) {
    self.backgroundColor = UIColor(from: shape.backgroundColor)
    self.frame.origin = CGPoint(x: shape.origin.x, y: shape.origin.y)
    self.frame = CGRect(origin: self.frame.origin, size: CGSize(width: shape.width, height: shape.height))
  }
  
  func didMove() {
    return
  }
  
  func didTouched() {
    delegate?.didTouch(with: self.uuid)
  }
  
}

extension ShapeView {
  
  private func setTapGesture() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
    self.addGestureRecognizer(tapGesture)
  }
  
  @objc
  private func handleTap(sender: UITapGestureRecognizer) {
    didTouched()
  }
  
}
