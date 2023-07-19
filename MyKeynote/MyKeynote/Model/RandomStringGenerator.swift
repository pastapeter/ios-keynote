//
//  RandomStringGenerator.swift
//  MyKeynote
//
//  Created by Jung peter on 7/18/23.
//

import Foundation

protocol RandomStringGenerator {
  func next() -> String
}

struct StringRandomGenerator: RandomStringGenerator {
  func next() -> String {
    let base = "0123456789ABCDEFGHIGKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    return "\(base[base.index(base.startIndex, offsetBy: Int.random(in: (0..<base.count)))])"
  }
}


