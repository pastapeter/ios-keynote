//
//  ShapeProtocols.swift
//  MyKeynote
//
//  Created by Jung peter on 7/20/23.
//

import Foundation

protocol ShapeInitable {
  init(id: keynoteUUID, width: Int, height: Int, backgroundColor: KeynoteColor, origin: (x: Int, y: Int))
}

protocol Movable {
  func move(x: Int, y: Int)
}

protocol ShapeProtocol: ShapeInitable, Movable { }

