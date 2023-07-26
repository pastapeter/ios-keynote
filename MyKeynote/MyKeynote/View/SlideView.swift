//
//  SlideView.swift
//  MyKeynote
//
//  Created by Jung peter on 7/24/23.
//

import UIKit

protocol SlideViewDatasource: AnyObject {
  func numberOfShapeView() -> Int
  func slideView(_ slideView: SlideView, ShapeViewIndexAt index: Int) -> ShapeView
  func slideView(_ slideView: SlideView, editByUUID uuid: keynoteUUID, shape: Shape)
}

final class SlideView: UIView, ComponentEventDelegate {
  
  weak var delegate: ComponentEventDelegate?
  weak var datasource: SlideViewDatasource?
  private var shapeviews: [keynoteUUID: ShapeView] = [:]
  
  func reloadsubView(with uuid: keynoteUUID, by shape: Shape) {
    guard let shapeview = shapeviews[uuid] else { return }
    shapeview.updateview(by: shape)
  }
  
  func reloadData() {
    self.subviews.forEach { $0.removeFromSuperview() }
    guard let datasource = datasource else { return }
    var numberOfShapes = datasource.numberOfShapeView()
    for i in (0..<numberOfShapes) {
      let shapeView = datasource.slideView(self, ShapeViewIndexAt: i)
      self.addSubview(shapeView)
    }
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
    let shapeView = ShapeView(frame: CGRect(x: Int(shape.origin.x), y: Int(shape.origin.y), width: shape.width, height: shape.height), uuid: shape.id)
//    shapeView.backgroundColor = UIColor(from: shape.backgroundColor)
    shapeView.backgroundColor = .red
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
    delegate?.didTouchSlide()
  }
  
}
