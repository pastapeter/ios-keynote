//
//  InspectViewable.swift
//  MyKeynote
//
//  Created by Jung peter on 7/25/23.
//

import UIKit

protocol TitleSettable {
  func setTitle(with title: String)
}

protocol ValueSettable {
  associatedtype ValueType
  func setValue(with value: ValueType, mininum: ValueType?, maximum: ValueType?)
}

protocol DelegateSettable {
  func setDelegate(with delegate: some ComponentInspectable)
}

protocol InspectViewable: UIView, TitleSettable, ValueSettable, DelegateSettable { }
