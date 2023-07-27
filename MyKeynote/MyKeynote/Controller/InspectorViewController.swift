//
//  InspectorViewController.swift
//  MyKeynote
//
//  Created by Jung peter on 7/19/23.
//

import UIKit

class InspectorViewController: UIViewController {
  
  private lazy var shapeInspectView: UITableView = {
    let tableview = UITableView()
    tableview.backgroundColor = .systemGray4
    tableview.isScrollEnabled = false
    tableview.separatorStyle = .none
    return tableview
  }()
  
  var shapeInspector: ComponentInspectable?
  private var shapeInspectViewPresenter: ShapeInspectorViewPresenter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = shapeInspectView
  }
  
  func reloadInspector(with inspector: ComponentInspectable) {
    self.shapeInspector = inspector
    self.shapeInspectViewPresenter = ShapeInspectorViewPresenter(inspector: inspector)
    self.view = shapeInspectView
    shapeInspectView.dataSource = self.shapeInspectViewPresenter
    shapeInspectView.delegate = self
    shapeInspectViewPresenter?.setupViewDelegate()
    shapeInspectView.reloadData()
  }
  
    
}

extension InspectorViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}
