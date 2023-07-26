//
//  ColorSettingView.swift
//  MyKeynote
//
//  Created by Jung peter on 7/24/23.
//

import UIKit

class ColorSettingView: UIView, InspectViewable {
  
  typealias ValueType = String
  
  private var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "배경색"
    return label
  }()
  
  private lazy var setButton = setupButton()
  private weak var delegate: ColorSettable?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layout()
    setbackgroundColor()
  }
  
  func setDelegate(with delegate: some ComponentInspectable) {
    self.delegate = delegate
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    layout()
    setbackgroundColor()
  }
  
  func setTitle(with title: String) {
    self.titleLabel.text = title
  }
  
  func setValue(with value: String, mininum: String?, maximum: String?) {
    self.setButton.setTitle(value, for: .normal)
  }
  
}

extension ColorSettingView {
  
  @objc
  private func didTouchColorChange(_ sender: UIButton) {
    let picker = UIColorPickerViewController()
    picker.supportsAlpha = false
    self.findViewController()?.present(picker, animated: true)
    picker.delegate = self
  }
  
  private func setbackgroundColor() {
    self.backgroundColor = .clear
  }
  
  private func setupButton() -> UIButton {
    var config = UIButton.Configuration.filled()
    config.baseBackgroundColor = .yellow
    config.title = "0xFFCCOO"
    config.baseForegroundColor = .black
    let button = UIButton(configuration: config)
    button.addTarget(self, action: #selector(didTouchColorChange), for: .touchUpInside)
    return button
  }
  
  private func layout() {
    titleLabel.sizeToFit()
    titleLabel.frame = CGRect(x: 10, y: 10, width: titleLabel.frame.width, height: titleLabel.frame.height)
    
    setButton.frame = CGRect(x: 10, y: titleLabel.frame.origin.y + titleLabel.frame.height + 10, width: self.superview?.frame.width ?? 150, height: 45)
    
    addSubview(setButton)
    addSubview(titleLabel)
    

  }
  
}

extension ColorSettingView: UIColorPickerViewControllerDelegate {
  
  func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
    guard let keynoteColor = color.toKeynoteColor() else { return }
    self.delegate?.setBackgroundColor(red: keynoteColor.R, blue: keynoteColor.B, green: keynoteColor.G)
  }
  
}

fileprivate extension UIColor {
  func toKeynoteColor() -> KeynoteColor? {
    guard let rgb = self.cgColor.components else { return nil }
    return KeynoteColor(R: UInt8(ceil(rgb[0] * 255)), G: UInt8(ceil(rgb[0] * 255)), B: UInt8(ceil(rgb[0] * 255)))
  }
}
