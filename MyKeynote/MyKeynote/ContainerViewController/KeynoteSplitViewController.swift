//
//  KeynoteSplitViewController.swift
//  MyKeynote
//
//  Created by Jung peter on 7/19/23.
//

import UIKit

protocol KeynoteSplitViewControllerDelegate: AnyObject {
  
}

class KeynoteSplitViewController: UIViewController {
  
  enum Column {
    case left
    case right
    case middle
  }
  
  var viewControllers: [KeynoteSplitViewController.Column: UIViewController] {
    return keyNoteChildViewControllers
  }
  
  weak var delegate: KeynoteSplitViewControllerDelegate?
  private var keyNoteChildViewControllers: [KeynoteSplitViewController.Column: UIViewController] = [:]
  
  private var minimumLeftColumnWidth: CGFloat = 180
  private var minimumRightColumnWidth: CGFloat = 180
  
  init(navigatorViewController: UIViewController?, presentationViewController: UIViewController, inspectViewController: UIViewController?) {
    super.init(nibName: nil, bundle: nil)
    keyNoteChildViewControllers[.left] = navigatorViewController
    keyNoteChildViewControllers[.right] = inspectViewController
    keyNoteChildViewControllers[.middle] = presentationViewController
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addsubViewsOfChildViewController()
    setupStatusBar()
    setLayout()
  }
  
  required init?(coder: NSCoder, navigatorViewController: UIViewController?, presentationViewController: UIViewController, inspectViewController: UIViewController?) {
    super.init(coder: coder)
    keyNoteChildViewControllers[.left] = navigatorViewController
    keyNoteChildViewControllers[.right] = inspectViewController
    keyNoteChildViewControllers[.middle] = presentationViewController
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func setViewControllers(_ vc: UIViewController, for column: KeynoteSplitViewController.Column) {
    self.keyNoteChildViewControllers[column] = vc
  }
  
  func viewController(for column: KeynoteSplitViewController.Column) -> UIViewController? {
    return keyNoteChildViewControllers[column]
  }
  
  private func addsubViewsOfChildViewController() {
    keyNoteChildViewControllers.values.forEach { self.view.addSubview($0.view) }
  }
  
  private func setupStatusBar() {
    statusBarView?.backgroundColor = .systemGray
  }
  
  private func setLayout() {
    
    var leftColumnVC: UIViewController? = keyNoteChildViewControllers[.left]
    var middleColumnVC: UIViewController? = keyNoteChildViewControllers[.middle]
    var rightColumnVC: UIViewController? = keyNoteChildViewControllers[.right]
    let safeLayoutGuide = self.view.safeAreaLayoutGuide
    
    [leftColumnVC, rightColumnVC, middleColumnVC].forEach {
      $0?.view.translatesAutoresizingMaskIntoConstraints = false
      $0?.view.topAnchor.constraint(equalTo: safeLayoutGuide.topAnchor).isActive = true
      $0?.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    if let leftVC = leftColumnVC, let rightVC = rightColumnVC, let middleVC = middleColumnVC {
      
      leftVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
      leftVC.view.widthAnchor.constraint(equalToConstant: minimumLeftColumnWidth).isActive = true
      
      rightVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
      rightVC.view.widthAnchor.constraint(equalToConstant: minimumRightColumnWidth).isActive = true
      
      middleVC.view.leadingAnchor.constraint(equalTo: leftVC.view.trailingAnchor).isActive = true
      middleVC.view.trailingAnchor.constraint(equalTo: rightVC.view.leadingAnchor).isActive = true
    } else if let rightVC = rightColumnVC, let middleVC = middleColumnVC {
      
      middleVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
      middleVC.view.trailingAnchor.constraint(equalTo: rightVC.view.leadingAnchor).isActive = true
      rightVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
      rightVC.view.widthAnchor.constraint(equalToConstant: minimumRightColumnWidth).isActive = true
      
    } else if let middleVC = middleColumnVC, let leftVC = leftColumnVC {
      
      leftVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
      leftVC.view.trailingAnchor.constraint(equalTo: middleVC.view.leadingAnchor).isActive = true
      middleVC.view.trailingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
      leftVC.view.widthAnchor.constraint(equalToConstant: minimumLeftColumnWidth).isActive = true
      
    } else if let middleVC = middleColumnVC {
      
      middleVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
      middleVC.view.trailingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
      
    }
    
  }
  
}
