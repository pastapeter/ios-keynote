//
//  SlideFactory.swift
//  MyKeynote
//
//  Created by Jung peter on 7/24/23.
//

import Foundation

struct ShapeInfo: Equatable {
  
  static func == (lhs: ShapeInfo, rhs: ShapeInfo) -> Bool {
    lhs.shape == rhs.shape
  }
  
  var shape: Shape
  var inspector: ShapeInspector
}

protocol ShapeInfoFactoryProtocol {
  func createShapeInfo(type: Shape.Type) -> ShapeInfo
  func createShapeInfo(type: Shape.Type, origin: (x: Int, y: Int)) -> ShapeInfo
}

class ShapeInfoFactory: ShapeInfoFactoryProtocol {

  func createShapeInfo(type: Shape.Type) -> ShapeInfo {
    
    let shapeFactory = ShapeFactory()
    let inspectorFactory = InspectorFactory()
    let shape = shapeFactory.makeShape(type: type.self)
    return ShapeInfo(shape: shape, inspector: inspectorFactory.createInspector(shape: shape))
  }
  
  func createShapeInfo(type: Shape.Type, origin: (x: Int, y: Int)) -> ShapeInfo {
    let shapeFactory = ShapeFactory()
    let inspectorFactory = InspectorFactory()
    let shape = shapeFactory.makeShape(type: type, origin: origin)
    return ShapeInfo(shape: shape, inspector: inspectorFactory.createInspector(shape: shape))
  }
  
}

