//
//  InspectorFactory.swift
//  MyKeynote
//
//  Created by Jung peter on 7/24/23.
//

import Foundation

class InspectorFactory {
  
  func createInspector(shape: Shape) -> ShapeInspector {
    return ShapeInspector(shape: shape)
  }
  
}
