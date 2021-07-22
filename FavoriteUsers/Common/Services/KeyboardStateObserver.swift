//
//  KeyboardStateObserver.swift
//  Cart
//
//  Created by Andrey Volobuev on 22/07/2021.
//

import UIKit

protocol KeyboardStateObserverDelegate: AnyObject {
    func keyboardDidChangeState(to state: KeyboardState)
}

enum KeyboardState {
    case visible(frame: CGRect)
    case hidden
}

final class KeyboardStateObserver {

    weak var delegate: KeyboardStateObserverDelegate?

    func start() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardDidShow),
            name: UIResponder.keyboardDidShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardDidHide),
            name: UIResponder.keyboardDidHideNotification,
            object: nil)
    }

    @objc func keyboardDidShow(notification: NSNotification) {
        delegate?.keyboardDidChangeState(to: .visible(frame: frame(from: notification.userInfo)))
    }

    @objc func keyboardDidHide(notification: NSNotification) {
        delegate?.keyboardDidChangeState(to: .hidden)
    }

    private func frame(from userInfo: [AnyHashable: Any]?) -> CGRect {
        guard let keyboardFrame = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue else {
            return CGRect.zero
        }
        return keyboardFrame
    }
}
