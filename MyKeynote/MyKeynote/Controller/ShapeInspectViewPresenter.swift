//
//  ShapeInspectViewPresenter.swift
//  MyKeynote
//
//  Created by Jung peter on 7/24/23.
//

import UIKit

class ShapeInspectorViewPresenter: NSObject, ShapeDatasource, UITableViewDataSource {
  
  private var inspectViewFactory = InspectViewFactory()
  private var inspectViews: [any InspectViewable]
  private var inspector: ComponentInspectable
  
  init(inspector: ComponentInspectable) {
    self.inspector = inspector
    inspectViews = inspectViewFactory.createInspectViews(with: inspector)
    super.init()
  }
  
  func setupViewDelegate() {
    for inspectView in inspectViews {
      inspectView.setDelegate(with: inspector)
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    inspectViews.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell()
    let cellContentView: UIView = inspectViews[indexPath.row]
    cell.selectionStyle = .none
    cell.backgroundColor = .clear
    cell.contentView.addSubview(cellContentView)
    cellContentView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100)
    return cell
    
  }
  
  func shapeInspectViewTitle(_ inspectView: ShapeInspectView) -> String? {
    return "Hello World"
  }
  
  func shapeInspectViewSection(_ inspectView: ShapeInspectView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func numberOfSection(in inspectView: Int) -> Int {
    return 1
  }
  
}