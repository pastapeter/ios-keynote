//
//  AlphaSettingView.swift
//  MyKeynote
//
//  Created by Jung peter on 7/25/23.
//

import UIKit

class AlphaSettingView: UIView, InspectViewable {
  
  private var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "투명도"
    return label
  }()

  private lazy var alphaTextField = setupAlphaTextField()
  private lazy var alphaSettingStepper = setUpStepper()
  private lazy var contentStackView = setUpStackViewForAlpha()
  private weak var delegate: AlphaSettable?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layout()
    setbackgroundColor()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    layout()
    setbackgroundColor()
  }
  
  func setDelegate(with delegate: some ComponentInspectable) {
    self.delegate = delegate
  }
  
  func setTitle(with title: String) {
    self.titleLabel.text = title
  }
  
  func setValue(with value: Alpha, mininum: Alpha?, maximum: Alpha?) {
    self.alphaSettingStepper.value = Double(value.rawValue)
    self.alphaTextField.text = "\(self.alphaSettingStepper.value)"
  }
  
  @objc
  private func stepperAction(_ sender: UIStepper) {
    guard let newAlpha = Alpha(rawValue: Int(sender.value)) else { return }
    delegate?.setBackgroundAlpha(alpha: newAlpha)
  }
  
  
}

extension AlphaSettingView {
  
  private func setbackgroundColor() {
    self.backgroundColor = .clear
  }
  
  private func layout() {
    
    titleLabel.sizeToFit()
    titleLabel.frame = CGRect(x: 10, y: 10, width: titleLabel.frame.width, height: titleLabel.frame.height)
    
    contentStackView.frame = CGRect(x: 10,
                                    y: titleLabel.frame.origin.y + titleLabel.frame.height + 10,
                                    width: self.superview?.frame.width ?? 150,
                                    height: alphaSettingStepper.frame.height)
    
    addSubview(contentStackView)
    addSubview(titleLabel)
    
  }
  
  
  private func setUpStackViewForAlpha() -> UIStackView {
    let stackView = UIStackView(arrangedSubviews: [alphaTextField, alphaSettingStepper])
    stackView.distribution = .equalSpacing
    alphaTextField.widthAnchor.constraint(equalTo: alphaSettingStepper.widthAnchor, multiplier: 0.5).isActive = true
    return stackView
  }
  
  private func setUpStepper() -> UIStepper {
    let stepper: UIStepper = .init()
    stepper.maximumValue = Double(Alpha.min().rawValue)
    stepper.maximumValue = Double(Alpha.max().rawValue)
    stepper.translatesAutoresizingMaskIntoConstraints = false
    stepper.addTarget(self, action: #selector(stepperAction), for: .valueChanged)
    return stepper
  }
  
  private func setupAlphaTextField() -> UITextField {
    let textField: UITextField = .init()
    textField.backgroundColor = .white
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }
  
}
