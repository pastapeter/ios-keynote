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
  
  private var shape: Shape
  weak var delegate: ComponentEventDelegate?
  
  init(frame: CGRect, shape: Shape) {
    self.shape = shape
    super.init(frame: frame)
    setTapGesture()
  }
  
  required init?(coder: NSCoder, shape: Shape) {
    self.shape = shape
    super.init(coder: coder)
    setTapGesture()
  }
  
  required init?(coder: NSCoder) {
    self.shape = ShapeInfoFactory.createShapeInfo(type: Square.self).shape
    super.init(coder: coder)
    setTapGesture()
  }
  
  func didMove() {
    return
  }
  
  func didTouched() {
    delegate?.didTouch(with: self.shape)
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
  func didTouch(with shape: Shape)
  func didTouchSlide()
}

extension ComponentEventDelegate {
  
  func didTouch(with shape: Shape) {
    
  }
  
  func didTouchSlide() {
    
  }
  
}
