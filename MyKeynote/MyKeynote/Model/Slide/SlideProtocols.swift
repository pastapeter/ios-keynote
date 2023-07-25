//
//  SlideProtocols.swift
//  MyKeynote
//
//  Created by Jung peter on 7/20/23.
//

import Foundation

protocol AlphaSettable: AnyObject {
  func setBackgroundAlpha(alpha: Alpha)
}

protocol ColorSettable: AnyObject {
  func setBackgroundColor(red:UInt8,blue: UInt8, green: UInt8, alpha: Alpha)
  func setBackgroundColor(red: UInt8, blue: UInt8, green: UInt8)
}

protocol WidthSettable {
  func setWidth(to length: Int)
}

protocol SlideInitable {
  init(id: keynoteUUID, width: Int, backgroundColor: KeynoteColor)
}

protocol ShapeStorable {
  func addShape(_ shape: ShapeInfo)
  func insertShape(_ shape: ShapeInfo, at index: Int)
  func brintShapeToFront(_ shape: ShapeInfo)
  func sendShapeToBack(_ shape: ShapeInfo)
  func removeShape(_ shape: ShapeInfo)
}
