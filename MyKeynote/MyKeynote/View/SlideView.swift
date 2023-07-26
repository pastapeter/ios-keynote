//
//  SlideView.swift
//  MyKeynote
//
//  Created by Jung peter on 7/24/23.
//

import UIKit

protocol ShapeViewStorableDatasource: AnyObject {
  func numberOfShapeView() -> Int
  func slideView(_ slideView: SlideView, ShapeViewIndexAt index: Int) -> ShapeView
  func slideView(_ slideView: SlideView, editByUUID uuid: keynoteUUID, shape: Shape)
}

final class SlideView: UIView, ComponentEventDelegate {
  
  weak var delegate: ComponentEventDelegate?
  weak var datasource: ShapeViewStorableDatasource?
  private var shapeviews: [keynoteUUID: ShapeView] = [:]
  
  func reloadsubView(with uuid: keynoteUUID, by shape: Shape) {
    guard let shapeview = shapeviews[uuid] else { return }
    shapeview.updateview(by: shape)
  }
  
  func reloadData() {
    self.subviews.forEach { $0.removeFromSuperview() }
    guard let datasource = datasource else { return }
    let numberOfShapes = datasource.numberOfShapeView()
    for i in (0..<numberOfShapes) {
      let shapeView = datasource.slideView(self, ShapeViewIndexAt: i)
      self.addSubview(shapeView)
    }
  }
  
  func reloadBackgroundColor(with color: KeynoteColor) {
    self.backgroundColor = UIColor(from: color)
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
  
  func didTouch(with uuid: keynoteUUID) {
    delegate?.didTouch(with: uuid)
  }
  
}

extension SlideView {
  
  func makeShapeView(with shape: Shape) -> ShapeView {
    let shapeView = ShapeView(frame: CGRect(x: Int(shape.origin.x) - (shape.width / 2), y: Int(shape.origin.y) - (shape.height / 2), width: shape.width, height: shape.height), uuid: shape.id)
    shapeView.backgroundColor = UIColor(from: shape.backgroundColor)
    shapeView.delegate = self
    shapeviews.updateValue(shapeView, forKey: shape.id)
    return shapeView
  }
  
  private func setTapGestureToSelf() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOnSlide(sender:)))
    self.addGestureRecognizer(tapGesture)
  }
  
  @objc
  private func handleTapOnSlide(sender: UITapGestureRecognizer) {
    shapeviews.values.forEach { $0.deselect() }
    delegate?.didTouchSlide()
  }
  
}
