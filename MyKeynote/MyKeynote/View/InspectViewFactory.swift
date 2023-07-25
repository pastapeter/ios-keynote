//
//  InspectViewFactory.swift
//  MyKeynote
//
//  Created by Jung peter on 7/25/23.
//

import UIKit

protocol InspectViewFactoryProtocol {
  func createInspectViews<Inspector: ComponentInspectable>(with inspector: Inspector) -> [any InspectViewable]
}

final class InspectViewFactory: InspectViewFactoryProtocol {
  
  func createInspectViews<Inspector: ComponentInspectable>(with inspector: Inspector) -> [any InspectViewable] {
    
    if type(of: inspector) == ShapeInspector.self {
      return [ColorSettingView(frame: .zero), AlphaSettingView(frame: .zero)]
    } else if type(of: inspector) == BaseSlide.self {
      return [ColorSettingView(frame: .zero)]
    }
    return []
  }
  
}
