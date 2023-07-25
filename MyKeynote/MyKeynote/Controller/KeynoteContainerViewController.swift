//
//  MainViewController.swift
//  MyKeynote
//
//  Created by Jung peter on 7/17/23.
//

import UIKit

final class KeynoteContainerViewController: KeynoteSplitViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavigatorDatasource()
    parseNavigatorDatasource()
    parseDatasourceToInspecterViewcontroller()
  }
  
  weak var navigateDatasource: NavigatorDataSource?
  
  func setNavigatorDatasource() {
    guard let navigatorVC = viewControllers[.left] as? NavigatorViewController else { return }
    self.navigateDatasource = navigatorVC
  }
  
  func parseNavigatorDatasource() {
    guard let presentingVC = viewControllers[.middle] as? PresentingViewController else { return }
    presentingVC.navigateDatasource = navigateDatasource
    presentingVC.outputDelegate = self
    presentingVC.reloadData()
  }
  
  func parseDatasourceToInspecterViewcontroller() {
    guard let inspectorVC = viewControllers[.right] as? InspectorViewController else { return }
    guard let selectedSlide = self.navigateDatasource?.selectedSlideInfo() else { return }
    inspectorVC.reloadInspector(with: selectedSlide)
  }

}

extension KeynoteContainerViewController: PresentingOutputDelegate {
  
  func output(didSelectFromSlideView shape: Shape) {
    
    self.navigateDatasource?.selectedSlideInfo()?.shapes.forEach { $0.shape.isSelected = false }
    
    shape.isSelected = true
    
    guard let selectedInspector = self.navigateDatasource?.selectedSlideInfo()?.shapes.first(where: { $0.shape == shape })?.inspector else { return }
    guard let inspectorVC = viewControllers[.right] as? InspectorViewController else { return }
    inspectorVC.reloadInspector(with: selectedInspector)
    
  }
  
  func didTouchOnSlideView() {
    self.navigateDatasource?.selectedSlideInfo()?.shapes.forEach { $0.shape.isSelected = false }
    
    guard let inspectorVC = viewControllers[.right] as? InspectorViewController else { return }
    guard let selectedSlide = self.navigateDatasource?.selectedSlideInfo() else { return }
    inspectorVC.reloadInspector(with: selectedSlide)
  }
  
}


