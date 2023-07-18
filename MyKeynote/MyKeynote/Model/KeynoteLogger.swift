//
//  KeynoteLogger.swift
//  MyKeynote
//
//  Created by Jung peter on 7/19/23.
//

import Foundation
import OSLog

struct KeynoteLogger {
  
  static func log(_ slides: [BaseSlide]) {
    if #available(iOS 14.0, *) {
      let logger = Logger()
      for i in slides.indices {
        logger.log("Rect\(i+1) \(slides[i].description)")
      }
    }
  }
  
}
