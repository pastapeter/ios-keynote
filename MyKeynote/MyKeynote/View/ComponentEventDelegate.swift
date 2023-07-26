//
//  ComponentEventDelegate.swift
//  MyKeynote
//
//  Created by Jung peter on 7/25/23.
//

import Foundation

protocol ComponentEventDelegate: AnyObject {
  func didTouch(with uuid: keynoteUUID)
  func didTouchSlide()
}

extension ComponentEventDelegate {
  
  func didTouch(with uuid: keynoteUUID) { }
  
  func didTouchSlide() { }
  
}
