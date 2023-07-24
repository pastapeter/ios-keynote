//
//  ShapeInspectView.swift
//  MyKeynote
//
//  Created by Jung peter on 7/19/23.
//

import UIKit

protocol ShapeDatasource: AnyObject {
  func shapeInspectViewTitle(_ inspectView: ShapeInspectView) -> String?
  func shapeInspectViewSection(_ inspectView: ShapeInspectView, numberOfRowsInSection section: Int) -> Int
  func numberOfSection(in inspectView: Int) -> Int
}

class ShapeInspectView: UIView {

  private var contentStackView = UIStackView(frame: .zero)
  private var alphaStackView = UIStackView(frame: .zero)
  
  weak var delegate: ShapeInspectable?
  weak var datasource: ShapeDatasource?
  
  init(frame: CGRect, delegate: ShapeInspectable?, datasource: ShapeDatasource?) {
    self.delegate = delegate
    super.init(frame: frame)
    setupStackViews()
    setBackground()
    addsubviews()
    layout()
  }
  
  required init?(coder: NSCoder, delegate: ShapeInspectable?, datasource: ShapeDatasource?) {
    self.delegate = delegate
    super.init(coder: coder)
    setupStackViews()
    setBackground()
    addsubviews()
    layout()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setBackground()
  }
  
  func reloadData() {
    configure()
  }
  
  private func configure() {
    guard let datasource = datasource else { return }
  }
  
  @objc
  private func didTouchchangColorbutton() {
      return
  }
  
  @objc
  private func didChangeAlphaValue() {
    return
  }
  
}

// MARK: - Private Function
extension ShapeInspectView {
  
  private func setupStackViews() {
    contentStackView = configureContentStackView(title: "배경색", views: [setupButton(with: "0xFFCC00")])
    alphaStackView = configureContentStackView(title: "투명도", views: [configureStackViewForAlpha()])
  }
  
  private func setupButton(with hexColor: String) -> UIButton {
    var config = UIButton.Configuration.filled()
    config.baseBackgroundColor = .yellow
    config.title = "0xFFCC00"
    config.baseForegroundColor = .black
    let button = UIButton(configuration: config)
    button.addTarget(self, action: #selector(didTouchchangColorbutton), for: .touchUpInside)
    return button
  }
  
  private func setupLabel(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }
  
  private func setUpStepper() -> UIStepper {
    let stepper: UIStepper = .init()
    stepper.maximumValue = Double(Alpha.min().rawValue)
    stepper.maximumValue = Double(Alpha.max().rawValue)
    stepper.translatesAutoresizingMaskIntoConstraints = false
    stepper.addTarget(self, action: #selector(didChangeAlphaValue), for: .valueChanged)
    return stepper
  }
  
  private func setupAlphaTextField() -> UITextField {
    var textField: UITextField = .init()
    textField.backgroundColor = .white
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }
  
  private func setBackground() {
    self.backgroundColor = .systemGray4
  }
  
  private func addsubviews() {
    [alphaStackView, contentStackView].forEach { self.addSubview($0)}
  }
  
  private func configureContentStackView(title: String, views: [UIView]) -> UIStackView {
    let titleLabel = setupLabel(text: title)
    let stackView = UIStackView(arrangedSubviews: [titleLabel] + views)
    stackView.axis = .vertical
    stackView.spacing = 10
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }
  
  private func configureStackViewForAlpha() -> UIStackView {
    let textField = setupAlphaTextField()
    let stepper = setUpStepper()
    let stackView = UIStackView(arrangedSubviews: [textField, stepper])
    stackView.distribution = .equalSpacing
    stackView.translatesAutoresizingMaskIntoConstraints = false
    textField.widthAnchor.constraint(equalTo: stepper.widthAnchor, multiplier: 0.5).isActive = true
    return stackView
  }
  
  private func layout() {
    
    let safeAreaGuide = self.safeAreaLayoutGuide
    
    contentStackView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 10).isActive = true
    contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    
    alphaStackView.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 10).isActive = true
    alphaStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    alphaStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
  }
  
}
