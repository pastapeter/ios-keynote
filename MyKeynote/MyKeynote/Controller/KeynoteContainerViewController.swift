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
  
  func output(didSelectFromSlideView uuid: keynoteUUID) {
    
    guard let selectedInspector = self.navigateDatasource?.selectedSlideInfo()?.find(uuid)?.inspector else { return }
    guard let inspectorVC = viewControllers[.right] as? InspectorViewController else { return }
    inspectorVC.reloadInspector(with: selectedInspector)
    
  }
  
  func didTouchOnSlideView() {
    guard let inspectorVC = viewControllers[.right] as? InspectorViewController else { return }
    guard let selectedSlide = self.navigateDatasource?.selectedSlideInfo() else { return }
    inspectorVC.reloadInspector(with: selectedSlide) //TYPE: BaseSlide
  }
  
}


