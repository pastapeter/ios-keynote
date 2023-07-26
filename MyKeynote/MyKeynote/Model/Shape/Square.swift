//
//  Square.swift
//  MyKeynote
//
//  Created by Jung peter on 7/20/23.
//

import Foundation

protocol Squarable: Shape {
  init(id: keynoteUUID, width: Int, backgroundColor: KeynoteColor, origin: (x: Int, y: Int))
}

class Square: Shape, Squarable {
  
  required init(id: keynoteUUID, width: Int, backgroundColor: KeynoteColor, origin: (x: Int, y: Int)) {
    super.init(id: id, width: width, height: width, backgroundColor: backgroundColor, origin: origin)
  }
  
  required init(id: keynoteUUID, width: Int, height: Int, backgroundColor: KeynoteColor, origin: (x: Int, y: Int)) {
    
    var selectedLength = 0
    if width > height {
      selectedLength = width
    } else { selectedLength = height }
    
    super.init(id: id, width: selectedLength, height: selectedLength, backgroundColor: backgroundColor, origin: origin)
  }
  
  override func setWidth(to length: Int) {
    super.setWidth(to: length)
    super.setHeight(to: length)
  }
  
  override func setHeight(to length: Int) {
    super.setWidth(to: length)
    super.setHeight(to: length)
  }
  
  
}
