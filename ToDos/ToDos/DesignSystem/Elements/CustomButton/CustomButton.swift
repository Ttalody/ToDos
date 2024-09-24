//
//  CustomButton.swift
//  ToDos
//
//  Created by Artur Akulich on 23.09.24.
//

import UIKit

public class CustomButton: UIButton {
    
    // MARK: - Constants
    public enum Constants {
        
        public static let defaultTitleFont: UIFont = .footnoteButton()

        enum StateConstants {
            enum Primary {
                enum Normal {
                    static let backgroundColor: UIColor = .appGreen
                    static let titleColor: UIColor = .buttonText
                }
                
                enum Disabled {
                    static let backgroundColor: UIColor = .highlightedButton
                    static let titleColor: UIColor = .buttonText
                }
                
                enum Highlighted {
                    static let backgroundColor: UIColor = .highlightedButton
                    static let titleColor: UIColor = .buttonText
                }
            }
        }
    }
    
    // MARK: - Properties
    private var onTap: (() -> Void)?
    
    public var attribute: CustomButton.Attribute? {
        didSet {
            guard let attribute = attribute else {
                return
            }
            updateView(with: attribute)
        }
    }
    
    // MARK: - Init
    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupView() {
        layer.cornerRadius = Grid.CornerRadius.button
        addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }
    
    private func updateView(with attribute: CustomButton.Attribute) {
        onTap = attribute.onTap
        setTitle(attribute.title, for: .normal)
        
        setTitleColor(attribute.buttonStyle.normalStateAttribute.titleColor, for: .normal)
        setTitleColor(attribute.buttonStyle.disabledStateAttribute.titleColor, for: .disabled)
        setTitleColor(attribute.buttonStyle.highlightedStateAttribute.titleColor, for: .highlighted)
        
        backgroundColor = attribute.buttonStyle.normalStateAttribute.backgroundColor
        
        titleLabel?.font = attribute.titleFont
        contentEdgeInsets = attribute.inset
    }
    
    public override var isEnabled: Bool {
        didSet {
            self.backgroundColor = isEnabled ? attribute?.buttonStyle.normalStateAttribute.backgroundColor :
            attribute?.buttonStyle.disabledStateAttribute.backgroundColor
            self.layoutIfNeeded()
        }
    }
    
    public override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = isHighlighted ? attribute?.buttonStyle.highlightedStateAttribute.backgroundColor :
            attribute?.buttonStyle.normalStateAttribute.backgroundColor
            self.layoutIfNeeded()
        }
    }
}

extension CustomButton {
    // MARK: - Button tap function
    @objc private func didTap() {
        onTap?()
    }
}
