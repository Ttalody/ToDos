//
//  HintView.swift
//  ToDos
//
//  Created by Artur Akulich on 23.09.24.
//

import UIKit
import SnapKit

public class HintView: UIView {
    private enum Constants {
        static let loadingText = "It’ll take a couple of seconds"
    }
    
    // MARK: - Components
    private lazy var hintLabel: UILabel = .init()
    private lazy var activitiIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .captionText
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    private lazy var hintImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Properties
    public var attribute: HintView.Attribute? {
        didSet {
            guard let attribute = attribute else {
                return
            }
            updateView(with: attribute)
        }
    }
    
    public var isLodaing: Bool = false {
        didSet {
            updateState()
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
    
    // MARK: - Private methods
    private func setupView() {
        backgroundColor = .backgroundGrey
        layer.cornerRadius = Grid.CornerRadius.hintView
        setupConstraints()
    }
    
    private func updateView(with attribute: Attribute) {
        hintLabel.text = attribute.text
        hintLabel.textColor = attribute.textColor
        hintLabel.font = attribute.textFont
        hintImageView.image = attribute.icon
    }
    
    private func updateState() {
        if isLodaing {
            hintImageView.isHidden = true
            activitiIndicator.startAnimating()
            hintLabel.text = Constants.loadingText
        } else {
            hintImageView.isHidden = false
            activitiIndicator.stopAnimating()
            hintLabel.text = attribute?.text
        }
    }
    
    private func setupConstraints() {
        addSubview(hintImageView)
        hintImageView.snp.makeConstraints { make in
            make.size.equalTo(Grid.Size.xl5)
            make.verticalEdges.leading.equalToSuperview().inset(Grid.Spacing.m)
        }
        
        addSubview(hintLabel)
        hintLabel.snp.makeConstraints { make in
            make.leading.equalTo(hintImageView.snp.trailing).offset(Grid.Spacing.m)
            make.trailing.equalToSuperview().inset(Grid.Spacing.m)
            make.centerY.equalToSuperview()
        }
        
        addSubview(activitiIndicator)
        activitiIndicator.snp.makeConstraints { make in
            make.size.equalTo(Grid.Size.xl5)
            make.verticalEdges.leading.equalToSuperview().inset(Grid.Spacing.m)
        }
    }
}
