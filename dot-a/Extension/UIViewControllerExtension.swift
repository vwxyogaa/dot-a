//
//  UIViewController.swift
//  dot-a
//
//  Created by yxgg on 04/06/22.
//

import Foundation
import UIKit

extension UIViewController {
  func presentAlert(
    title: String?,
    message: String?,
    titleActionOne: String?,
    completionActionOne: @escaping (UIAlertAction) -> Void,
    titleActionTwo: String?,
    completionActionTwo: @escaping (UIAlertAction) -> Void) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: titleActionOne, style: .default, handler: completionActionOne))
    alert.addAction(UIAlertAction(title: titleActionTwo, style: .default, handler: completionActionTwo))
    present(alert, animated: true)
  }
}
