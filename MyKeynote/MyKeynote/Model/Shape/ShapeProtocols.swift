//
//  ShapeProtocols.swift
//  MyKeynote
//
//  Created by Jung peter on 7/20/23.
//

import Foundation

protocol ShapeInitable {
  init(id: keynoteUUID, width: Int, height: Int, backgroundColor: KeynoteColor, origin: (x: Double, y: Double))
}

protocol Movable {
  func move(x: Double, y: Double)
}

protocol ShapeProtocol: ShapeInitable, Movable { }

