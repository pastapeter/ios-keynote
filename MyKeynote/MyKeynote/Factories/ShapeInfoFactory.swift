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
}

class ShapeInfoFactory: ShapeInfoFactoryProtocol {
  
  func createShapeInfo(type: Shape.Type) -> ShapeInfo {
    
    let shapeFactory = ShapeFactory()
    let inspectorFactory = InspectorFactory()
    let shape = shapeFactory.makeShape(type: type.self)
    return ShapeInfo(shape: shape, inspector: inspectorFactory.createInspector(shape: shape))
  }
  
}

