//
//  SlideUUID.swift
//  MyKeynote
//
//  Created by Jung peter on 7/18/23.
//

import Foundation

struct SlideUUID: Hashable, CustomStringConvertible {
  
  private static func random<G: RandomStringGenerator>(using generator: inout G, length: Int) -> String {
    var result = ""
    for _ in (0..<length) {
      result += generator.next()
    }
    return result
  }

  private var wrappedValue: String
  
  init(randomGenerator: RandomStringGenerator = StringRandomGenerator(), length: Int = 9) {
    var randomGenerator = randomGenerator
    var result = SlideUUID.random(using: &randomGenerator, length: length)
    result.insert("-", at: result.index(result.startIndex, offsetBy: 3))
    result.insert("-", at: result.index(result.endIndex, offsetBy: -3))
    wrappedValue = result
  }
  
  var description: String {
    return wrappedValue
  }
  
}

