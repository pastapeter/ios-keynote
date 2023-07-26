//
//  MainViewController.swift
//  MyKeynote
//
//  Created by Jung peter on 7/17/23.
//

import UIKit

final class KeynoteContainerViewController: KeynoteSplitViewController {
  
  private var currentSlide: BaseSlide? {
    didSet {
      parseCurrentSlideToInspectorViewController()
      parseShapesInCurrentSlideToPresentingViewController()
    }
  }
  
  override init(navigatorViewController: UIViewController?, presentationViewController: UIViewController, inspectViewController: UIViewController?) {
    super.init(navigatorViewController: navigatorViewController, presentationViewController: presentationViewController, inspectViewController: inspectViewController)
    addObserverForSlideChange()
    guard let navigatorVC = navigatorViewController as? NavigatorViewController else { return }
    currentSlide = navigatorVC.getFirstSlide()
    
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    addObserverForSlideChange()
  }
  
  required init?(coder: NSCoder, navigatorViewController: UIViewController?, presentationViewController: UIViewController, inspectViewController: UIViewController?) {
    super.init(coder: coder, navigatorViewController: navigatorViewController, presentationViewController: presentationViewController, inspectViewController: inspectViewController)
    addObserverForSlideChange()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    parseShapesInCurrentSlideToPresentingViewController()
    parseCurrentSlideToInspectorViewController()
  }
  
}

extension KeynoteContainerViewController: PresentingOutputDelegate {
  
  func output(didSelectFromSlideView uuid: keynoteUUID) {
    parseInspectorOfSelectedShapeInCurrentSlide(by: uuid)
  }
  
  func didTouchOnSlideView() {
    parseCurrentSlideToInspectorViewController()
  }
  
}

// MARK: - Private methods

extension KeynoteContainerViewController {
  
  private func addObserverForSlideChange() {
    NotificationCenter.default.addObserver(self, selector: #selector(didReceiveSlideChange), name: NotificationCenterConstant.SlideChange.name, object: nil)
  }
  
  @objc
  private func didReceiveSlideChange(_ sender: Notification) {
    guard let slide = sender.userInfo?["CurrentSlide"] as? BaseSlide else { return }
    currentSlide = slide
  }

  
  private func parseShapesInCurrentSlideToPresentingViewController() {
    guard let presentingVC = viewControllers[.middle] as? PresentingViewController else { return }
    presentingVC.currentShapes = currentSlide?.shapes.map { $0.shape } ?? []
    presentingVC.outputDelegate = self
    presentingVC.reloadData()
  }
  
  private func parseCurrentSlideToInspectorViewController() {
    guard let inspectorVC = viewControllers[.right] as? InspectorViewController else { return }
    guard let currentSlide = currentSlide else { return }
    inspectorVC.reloadInspector(with: currentSlide)
  }
  
  private func parseInspectorOfSelectedShapeInCurrentSlide(by uuid: keynoteUUID) {
    guard let currentInspector = currentSlide?.find(uuid)?.inspector else { return }
    guard let inspectorVC = viewControllers[.right] as? InspectorViewController else { return }
    inspectorVC.reloadInspector(with: currentInspector)
  }
  
}


