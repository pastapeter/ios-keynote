//
//  statusBarView.swift
//  MyKeynote
//
//  Created by Jung peter on 7/20/23.
//

import UIKit

extension UIViewController {
    var statusBarView: UIView? {
        if #available(iOS 15.0, *) {
            let statusBarFrame = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.statusBarManager?.statusBarFrame
            if let statusBarFrame = statusBarFrame {
                let statusBar = UIView(frame: statusBarFrame)
                view.addSubview(statusBar)
                return statusBar
            } else {
                return nil
            }
        } else {
            return UIApplication.shared.value(forKey: "statusBar") as? UIView
        }
    }
}
