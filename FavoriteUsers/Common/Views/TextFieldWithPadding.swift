//
//  TextFieldWithPadding.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 22/07/2021.
//

import UIKit

final class TextFieldWithPadding: UITextField {
    
    private let padding: UIEdgeInsets
    
    init(padding: UIEdgeInsets, cornerRadius: CGFloat = 0) {
        self.padding = padding
        super.init(frame: CGRect.zero)
        self.layer.cornerRadius = cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
}
