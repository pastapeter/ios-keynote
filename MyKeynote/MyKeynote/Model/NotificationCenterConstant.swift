//
//  NotificationCenterConstant.swift
//  MyKeynote
//
//  Created by Jung peter on 7/25/23.
//

import Foundation

enum NotificationCenterConstant: String {

  case Slide
  case Shape
  case SlideChange
  
  var name: NSNotification.Name {
    return NSNotification.Name(self.rawValue)
  }
}
