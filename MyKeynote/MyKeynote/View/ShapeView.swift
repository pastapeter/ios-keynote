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
  private var isSelected: Bool = false {
    didSet {
      if isSelected {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
      } else {
        self.layer.borderWidth = 0
      }
    }
  }
  
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
  
  // 귀찮아도 하자
  func updateview(by shape: Shape) {
    // Shape -> 위에서 바꿔라
    self.backgroundColor = UIColor(from: shape.backgroundColor)
    self.frame.origin = CGPoint(x: Int(shape.origin.x) - (shape.width / 2), y: Int(shape.origin.y) - (shape.height / 2))
    self.frame = CGRect(origin: self.frame.origin, size: CGSize(width: shape.width, height: shape.height))
  }
  
  func didMove() {
    return
  }
  
  func didTouched() {
    delegate?.didTouch(with: self.uuid)
    select()
  }
  
  func deselect() {
    if isSelected == true {
      isSelected = false
    }
  }
  
  func select() {
    if isSelected == false {
        isSelected = true
    }
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
