//
//  SlideView.swift
//  MyKeynote
//
//  Created by Jung peter on 7/24/23.
//

import UIKit

final class SlideView: UIView, ComponentEventDelegate {
  
  private var shapes: [Shape] = []
  weak var delegate: ComponentEventDelegate?
  
  func setslideInfo(info: BaseSlide) {
    shapes = info.shapes.map { $0.shape }
    let shapeViews = shapes.map {
      let view = ShapeView(frame: CGRect(x: Int($0.origin.x), y: Int($0.origin.y), width: 50, height: 50), shape: $0)
      view.backgroundColor = .red
      view.delegate = self
      return view
    }
    shapeViews.forEach { self.addSubview($0) }
    layoutIfNeeded()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    setTapGestureToSelf()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.backgroundColor = .white
    setTapGestureToSelf()
  }
  
  private func setTapGestureToSelf() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOnSlide(sender:)))
    self.addGestureRecognizer(tapGesture)
  }
  
  @objc
  func handleTapOnSlide(sender: UITapGestureRecognizer) {
    delegate?.didTouchSlide()
  }
  
  func didTouch(with shape: Shape) {
    delegate?.didTouch(with: shape)
  }
  
  
}
