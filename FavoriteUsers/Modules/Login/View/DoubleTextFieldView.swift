//
//  DoubleTextFieldView.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 22/07/2021.
//

import UIKit

final class DoubleTextFieldView: UIView {
    
    let textField1: UITextField
    let textField2: UITextField
    lazy var button = UIButton(type: .system)
    var isButtonEnabledRule: (String, String) -> Bool = { _, _ in true }

    lazy var stackView: UIStackView = { stv in
        stv.translatesAutoresizingMaskIntoConstraints = false
        stv.axis = .vertical
        stv.distribution = .fill
        return stv
    }(UIStackView(arrangedSubviews: [
        textField1,
        textField2,
        button
    ]))
    
    init(textFieldsPadding: UIEdgeInsets, cornerRadius: CGFloat = 0) {
        self.textField1 = TextFieldWithPadding(padding: textFieldsPadding, cornerRadius: cornerRadius)
        self.textField2 = TextFieldWithPadding(padding: textFieldsPadding, cornerRadius: cornerRadius)
        super.init(frame: CGRect.zero)
        self.textField1.addTarget(self,
                                  action: #selector(textFieldEditingChanged(sender:)),
                                  for: .editingChanged)
        self.textField2.addTarget(self,
                                  action: #selector(textFieldEditingChanged(sender:)),
                                  for: .editingChanged)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    func commonInit() {
        button.isEnabled = false
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            rightAnchor.constraint(equalTo: stackView.rightAnchor),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
    
    @objc func textFieldEditingChanged(sender: UITextField) {
        button.isEnabled = isButtonEnabledRule(textField1.text ?? "", textField2.text ?? "")
    }
}

extension DoubleTextFieldView {
    func applyLoginStyle() {
        [textField1, textField2].forEach { txf in
            txf.layer.borderColor = UIColor.systemGray4.cgColor
            txf.layer.borderWidth = 1
            txf.textColor = .label
        }
        textField1.placeholder = "Username"
        textField2.placeholder = "Password"
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        stackView.spacing = 16
        stackView.setCustomSpacing(22, after: textField2)
    }
}
