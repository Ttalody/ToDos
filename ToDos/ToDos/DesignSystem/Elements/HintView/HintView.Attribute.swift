//
//  HintView.Attribute.swift
//  ToDos
//
//  Created by Artur Akulich on 23.09.24.
//

import UIKit

extension HintView {
    public struct Attribute {
        var text: String
        var icon: UIImage?
        var textColor: UIColor
        var textFont: UIFont
        
        public init(
            text: String,
            icon: UIImage?,
            textColor: UIColor = .captionText,
            textFont: UIFont = .footnoteRegular()
        ) {
            self.text = text
            self.icon = icon
            self.textColor = textColor
            self.textFont = textFont
        }
    }
}
