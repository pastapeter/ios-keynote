//
//  NavigationView.swift
//  MyKeynote
//
//  Created by Jung peter on 7/19/23.
//

import UIKit

protocol NavigatorViewDataSource: AnyObject {
  
}

protocol NavigatorViewDelegate: AnyObject {
  
}

class NavigatorView: UIView {

  weak var delegate: NavigatorViewDelegate?
  weak var datasource: NavigatorViewDataSource?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
}
