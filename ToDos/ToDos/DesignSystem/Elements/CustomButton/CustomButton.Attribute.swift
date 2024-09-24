//
//  CustomButton.Attribute.swift
//  ToDos
//
//  Created by Artur Akulich on 23.09.24.
//

import UIKit

extension CustomButton {
    
    public struct Attribute {
        
        public struct ButtonStyle {
            
            public struct StateAttribute {
                let backgroundColor: UIColor?
                let titleColor: UIColor?
                
                public init(
                    backgroundColor: UIColor?,
                    titleColor: UIColor?
                ) {
                    self.backgroundColor = backgroundColor
                    self.titleColor = titleColor
                }
            }
            
            let normalStateAttribute: StateAttribute
            let disabledStateAttribute: StateAttribute
            let highlightedStateAttribute: StateAttribute
            
            public static var primary: ButtonStyle {
                return .init(
                    normalStateAttribute: .init(
                        backgroundColor: Constants.StateConstants.Primary.Normal.backgroundColor,
                        titleColor: Constants.StateConstants.Primary.Normal.titleColor),
                    disabledStateAttribute: .init(
                        backgroundColor: Constants.StateConstants.Primary.Disabled.backgroundColor,
                        titleColor: Constants.StateConstants.Primary.Disabled.titleColor),
                    highlightedStateAttribute: .init(
                        backgroundColor: Constants.StateConstants.Primary.Highlighted.backgroundColor,
                        titleColor: Constants.StateConstants.Primary.Highlighted.titleColor)
                )
            }
            
            public init(
                normalStateAttribute: StateAttribute,
                disabledStateAttribute: StateAttribute,
                highlightedStateAttribute: StateAttribute
            ) {
                self.normalStateAttribute = normalStateAttribute
                self.disabledStateAttribute = disabledStateAttribute
                self.highlightedStateAttribute = highlightedStateAttribute
            }
            
            public init(
                stateAttribute: StateAttribute
            ) {
                self.normalStateAttribute = stateAttribute
                self.disabledStateAttribute = stateAttribute
                self.highlightedStateAttribute = stateAttribute
            }
        }
        
        let titleFont: UIFont?
        var title: String?
        let inset: UIEdgeInsets
        let buttonStyle: ButtonStyle
        let onTap: (() -> Void)?
        
        public init(
            buttonStyle: ButtonStyle = .primary,
            title: String? = nil,
            titleFont: UIFont? = Constants.defaultTitleFont,
            inset: UIEdgeInsets = .init(top: Grid.Spacing.m, left: Grid.Spacing.xl4, bottom: Grid.Spacing.m, right: Grid.Spacing.xl4),
            onTap: (() -> Void)? = nil
        ) {
            self.titleFont = titleFont
            self.title = title
            self.inset = inset
            self.buttonStyle = buttonStyle
            self.onTap = onTap
        }
    }
}

