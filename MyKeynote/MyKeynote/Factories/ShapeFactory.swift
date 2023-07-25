//
//  ShapeFactory.swift
//  MyKeynote
//
//  Created by Jung peter on 7/20/23.
//

import Foundation

final class ShapeFactory {
  
  let maxWidth = 1200
  let maxHeight = 900

  func makeShape(type: Shape.Type) -> some Shape {
    return type.init(id: keynoteUUID(), width: Int.random(in: 0..<maxWidth), height: Int.random(in: 0..<maxHeight), backgroundColor: KeynoteColor.random(), origin: (x: 0, y: 0))
  }

  func makeShape(type: Shape.Type, width: Int, height: Int) -> Shape {
    return type.init(id: keynoteUUID(), width: width, height: height, backgroundColor: KeynoteColor.random(), origin: (x: 0, y: 0))
  }
  
}

// MARK: - For Square

extension ShapeFactory {
  
  func makeShape<Shape: Squarable>(type: Shape.Type) -> Shape {
    return type.init(id: keynoteUUID(), width: maxWidth, backgroundColor: KeynoteColor.random(), origin: (x: 0, y: 0))
  }
  
}

